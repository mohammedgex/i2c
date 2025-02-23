import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_grow/features/video/controller/download_certificat_controller.dart';

class DownloadPage extends StatelessWidget {
  final String slug;
  DownloadPage({required this.slug});

  final DownloadController _downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Certificate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (_downloadController.isDownloading.value) {
                return Column(
                  children: [
                    CircularProgressIndicator(
                      value: _downloadController.downloadProgress.value,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${(_downloadController.downloadProgress.value * 100).toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                );
              } else if (_downloadController.isDownloadComplete.value) {
                return Column(
                  children: [
                    Text(
                      'Download Complete!\nFile saved at: ${_downloadController.filePath.value}',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _downloadController.openDownloadedFile,
                      child: Text('Open Certificate'),
                    ),
                  ],
                );
              } else if (_downloadController.errorMessage.value.isNotEmpty) {
                return Text(
                  _downloadController.errorMessage.value,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                );
              } else {
                return Text('Press the button to start download');
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // _downloadController.downloadFile(slug);
              },
              child: Text('Download Certificate'),
            ),
          ],
        ),
      ),
    );
  }
}
