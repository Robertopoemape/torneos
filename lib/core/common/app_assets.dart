enum ComImg {
  notImg('assets/img/not-img.png'),
  logo('assets/svg/logo.png');

  const ComImg(this.path);
  final String path;
}

enum ComSvg {
  notImg('assets/svg/not-image.svg'),
  logo('assets/svg/logo.svg');

  const ComSvg(this.path);
  final String path;
}
