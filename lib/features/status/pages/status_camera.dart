import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class WhatsappCamera extends StatefulWidget {
  const WhatsappCamera({super.key});

  @override
  State<WhatsappCamera> createState() => _WhatsappCameraState();
}

class _WhatsappCameraState extends State<WhatsappCamera> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  int _selectedCameraIndex = 0;
  FlashMode _currentFlashMode = FlashMode.off;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController =
        CameraController(_cameras[_selectedCameraIndex], ResolutionPreset.high);

    try {
      await _cameraController.initialize();
      await _cameraController.setFlashMode(_currentFlashMode);
    } catch (e) {
      _showErrorDialog("Error initializing camera: $e");
    }

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> _takePicture() async {
    try {
      final image = await _cameraController.takePicture();

      print('Picture taken: ${image.path}');
    } catch (e) {
      _showErrorDialog("Error capturing image: $e");
    }
  }

  void _toggleCamera() {
    setState(() {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
      _initializeCamera();
    });
  }

  Future<void> _showErrorDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('Image selected from gallery: ${pickedFile.path}');
    } else {
      print('No image selected.');
    }
  }

  void _toggleFlash() {
    setState(() {
      _currentFlashMode =
          _currentFlashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
      _cameraController.setFlashMode(_currentFlashMode);
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _isCameraInitialized
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/icons/cross.png",
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleFlash,
                          child: Icon(
                            _currentFlashMode == FlashMode.off
                                ? Icons.flash_off
                                : Icons.flash_on,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CameraPreview(_cameraController),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: _pickFromGallery,
                          child: Image.asset(
                            "assets/icons/gallery.png",
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: _takePicture,
                          child: const Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                            size: 90,
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleCamera,
                          child: Image.asset(
                            "assets/icons/camera_change.png",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
