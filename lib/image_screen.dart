import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImgScr extends StatefulWidget {
  const ImgScr({Key? key}) : super(key: key);

  @override
  State<ImgScr> createState() => _ImgScrState();
}

class _ImgScrState extends State<ImgScr> {
  @override
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: const [
        Img1(
          url:
              'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        ),
        Img1(
          url:
              "https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=",
        ),
        Img1(
          url:
              "https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg",
        ),
        Img1(
          url:
              "https://gratisography.com/wp-content/uploads/2023/02/gratisography-colorful-kittenfree-stock-photo-800x525.jpg",
        ),
        Img1(
          url:
              "https://gratisography.com/wp-content/uploads/2023/02/gratisography-colorful-kittenfree-stock-photo-800x525.jpg",
        ),
      ],
    );
  }
}

class Img1 extends StatelessWidget {
  const Img1({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 1'),
      ),
      body: Center(
        child: CachedNetworkImage(
          height: 600,
          width: 600,
          imageUrl: url,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
