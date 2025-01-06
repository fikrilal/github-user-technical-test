import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:github_user_technical/_core/component/button_component.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../_core/constant/colors.dart';
import '../../../_core/constant/typography.dart';
import '../../../_core/helper/permission_helper.dart';
import '../../../_core/helper/photo_helper.dart';
import '../../../_core/helper/storage_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<Position> _getCurrentLocation() async {
    final status = await Permission.location.request();
    if (status.isDenied) {
      throw Exception('Location permissions are denied.');
    } else if (status.isPermanentlyDenied) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  late Future<Position> _currentLocation;

  String? _photoPath;

  @override
  void initState() {
    super.initState();
    _currentLocation = _getCurrentLocation();
    _loadPhotoPath();
  }

  Future<void> _loadPhotoPath() async {
    final path = await StorageHelper.getPhotoPath();
    setState(() {
      _photoPath = path;
    });
  }

  Future<void> _capturePhoto() async {
    try {
      await PermissionHelper.requestCameraPermission();
      final path = await PhotoHelper.capturePhoto();
      if (path != null) {
        setState(() {
          _photoPath = path;
        });
      }
    } catch (e) {
      _showError(e.toString());
    }
  }

  Future<void> _selectPhotoFromGallery() async {
    try {
      final path = await PhotoHelper.selectPhotoFromGallery();
      if (path != null) {
        setState(() {
          _photoPath = path;
        });
      }
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: _photoPath != null
                          ? Image.file(File(_photoPath!), fit: BoxFit.cover)
                          : Container(
                              color: Colors.grey,
                              child: Icon(Icons.person, size: 48.w),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child:
                      TypographyStyles.bodyMainBold('Ahmad Fikril Al Muzakki'),
                ),
                SizedBox(height: 32.h),
                buildDetailRow('Email', 'fikrildev@gmail.com'),
                buildDetailRow('Jabatan', 'Mobile Developer'),
                FutureBuilder<Position>(
                  future: _currentLocation,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDetailRow('Latitude', 'Loading...'),
                          buildDetailRow('Longitude', 'Loading...'),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDetailRow('Latitude', 'Error'),
                          buildDetailRow('Longitude', 'Error'),
                        ],
                      );
                    } else {
                      final position = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDetailRow('Latitude', '${position.latitude}'),
                          buildDetailRow('Longitude', '${position.longitude}'),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  child: ButtonComponent(
                    text: 'Refresh Geolocation',
                    onPressed: () {
                      setState(() {
                        _currentLocation = _getCurrentLocation();
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: ButtonComponent(
                    text: 'Capture Photo Picture',
                    variant: ButtonVariant.secondary,
                    onPressed: _capturePhoto,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: ButtonComponent(
                    text: 'Select Gallery',
                    variant: ButtonVariant.secondary,
                    onPressed: _selectPhotoFromGallery,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyStyles.bodyCaptionRegular(title),
        SizedBox(height: 8.h),
        TypographyStyles.bodyMainMedium(value),
        SizedBox(height: 4.h),
        const Divider(color: NeutralColors.neutral200),
        SizedBox(height: 16.h),
      ],
    );
  }
}
