import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletons/skeletons.dart';
import 'package:uuid/uuid.dart';

import '../core/style/app_colors.dart';

enum ImgTypeData {
  imgSVG,
  imgFile,
  imgLoading,
  imgLocalSVG,
  imgLocalPNG,
}

class ImageSvg extends StatefulWidget {
  const ImageSvg(
      {required this.pathNetwork,
      this.width,
      this.height,
      this.color,
      this.padding,
      this.fit = BoxFit.contain,
      this.isFile = true,
      this.isLocal = false,
      super.key});
  final String pathNetwork;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final BoxFit? fit;
  final bool isFile;
  final bool isLocal;

  @override
  State<ImageSvg> createState() => _ImageSvgState();
}

class _ImageSvgState extends State<ImageSvg> {
  ImgTypeData imgTypeData = ImgTypeData.imgLoading;
  String key = '';
  bool _errorEnCarga = false;

  void redirectionImage() {
    var uuiD = Uuid().v4();
    key = '$uuiD${widget.pathNetwork}';
    if (widget.pathNetwork.contains('http')) {
      if (widget.pathNetwork.contains('.svg')) {
        imgTypeData = ImgTypeData.imgSVG;
      }
      if (widget.pathNetwork.contains('.png') ||
          widget.pathNetwork.contains('.jpg') ||
          widget.pathNetwork.contains('.jpeg')) {
        imgTypeData = ImgTypeData.imgFile;
      }
      if (mounted) {
        setState(() {});
      }
      return;
    } else {
      if (widget.pathNetwork.contains('.svg')) {
        imgTypeData = ImgTypeData.imgLocalSVG;
      }
      if (widget.pathNetwork.contains('.png') ||
          widget.pathNetwork.contains('.jpg') ||
          widget.pathNetwork.contains('.jpeg')) {
        imgTypeData = ImgTypeData.imgLocalPNG;
      }
      if (mounted) {
        setState(() {});
      }
      return;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      redirectionImage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (imgTypeData) {
      case ImgTypeData.imgLocalPNG:
        return Padding(
          padding: widget.padding ?? const EdgeInsets.all(0),
          child: Image.asset(
            key: ValueKey(key),
            height: widget.height,
            width: widget.width,
            fit: widget.fit ?? BoxFit.contain,
            color: widget.color,
            widget.pathNetwork,
            errorBuilder: (context, error, stackTrace) => _crearWidgetError(),
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                return child;
              }
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                child: child,
              );
            },
          ),
        );

      case ImgTypeData.imgLocalSVG:
        return Padding(
          padding: widget.padding ?? const EdgeInsets.all(0),
          child: SvgPicture.asset(
            key: ValueKey(key),
            height: widget.height,
            width: widget.width,
            fit: widget.fit ?? BoxFit.contain,
            colorFilter: ColorFilter.mode(
                widget.color ?? ComColors.sec800,
                BlendMode
                    .srcIn), // widget.color != ComColors.sec500 ? widget.color : null,
            widget.pathNetwork,
            placeholderBuilder: (BuildContext context) => _crearSkeleton(),
          ),
        );

      case ImgTypeData.imgFile:
        return Padding(
          padding: widget.padding ?? const EdgeInsets.all(0),
          child: CachedNetworkImage(
            key: ValueKey(key),
            imageUrl: widget.pathNetwork,
            height: widget.height,
            width: widget.width,
            fit: widget.fit ?? BoxFit.contain,
            color: widget.color,
            placeholder: (context, url) => _crearSkeleton(),
            errorWidget: (context, url, error) => _crearWidgetError(),
          ),
        );

      case ImgTypeData.imgSVG:
        return CachedNetworkSVGImage(
          key: ValueKey(key),
          widget.pathNetwork,
          height: widget.height,
          width: widget.width,
          fit: widget.fit ?? BoxFit.contain,
          colorFilter: ColorFilter.mode(
              widget.color ?? ComColors.sec800, BlendMode.srcIn),
          placeholder: _crearSkeleton(),
          errorWidget: _crearWidgetError(),
        );

      default:
        return Center(
          child: widget.pathNetwork.contains('background')
              ? CircularProgressIndicator(
                  color: Colors.transparent,
                )
              : Skeleton(
                  isLoading: true,
                  skeleton: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      shape: BoxShape.rectangle,
                      height: widget.height,
                      width: widget.width,
                      maxHeight: 370,
                      maxWidth: 300,
                      padding:
                          EdgeInsets.all((widget.height ?? 0) >= 300 ? 0 : 4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: SizedBox.shrink()),
        );
    }
  }

  Widget _crearSkeleton() => Skeleton(
        isLoading: true,
        skeleton: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            shape: BoxShape.rectangle,
            height: widget.height,
            width: widget.width,
            maxHeight: 370,
            maxWidth: 300,
            padding: EdgeInsets.all((widget.height ?? 0) >= 300 ? 0 : 4),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: SizedBox.shrink(),
      );

  Widget _crearWidgetError() {
    if (!_errorEnCarga) {
      _errorEnCarga = true;
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _errorEnCarga = false;
          });
        }
      });
    }
    return _crearSkeleton();
  }
}
