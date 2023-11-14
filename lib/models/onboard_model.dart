class OnBoardModel {
  final String url, asset, title, subTitle;

  OnBoardModel(
      {required this.url,
      required this.asset,
      required this.title,
      required this.subTitle});
}

List<OnBoardModel> onBoards = [
  OnBoardModel(
      url:
          'https://images.squarespace-cdn.com/content/v1/61721629f5377a77f9b74774/7eabcf3d-c914-49de-9de3-20acfc7a5746/321298597bb815f53b159ddfa60fe7ff.jpg',
      asset: '321298597bb815f53b159ddfa60fe7ff.jpg',
      title: 'ColdnBrew',
      subTitle: 'Buy the best and premium\ncoffee makers'),
  OnBoardModel(
      url: 'https://c.top4top.io/p_449ixxwl5.jpg',
      asset: '66.jpg',
      title: 'Best Quality',
      subTitle:
          'Premium Quality that makes\ncoffee maker more elegant and\ndurable use'),
  OnBoardModel(
      url:
          'https://www.purekopiluwak.com/wp-content/uploads/2018/06/Pour-Over-D-1.jpg',
      asset: 'Pour-Over-D-1.jpg',
      title: 'Stylish Design',
      subTitle:
          'A unique and different style from\nother teapots gives more\nluxurious'),
];
// https://video01.alibaba.com/vod-icbu/4f4e1c368ac918af/6864ab5891533053/20221214_a70ca07c4ecbd959_391299034083_mp4_264_hd_unlimit_taobao.mp4?t=2102f5be16937030042061747e3fa1&b=icbu_video&p=cloudvideo_http_icbu_vod_video
