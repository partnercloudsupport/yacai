import 'package:flutter/material.dart';
import 'package:flutter_app/app/component/icon_tab.dart';
import 'package:flutter_app/app/model/job.dart';
import 'package:flutter_app/app/view/jobs_view.dart';
import 'package:flutter_app/app/view/message_view.dart';
import 'package:flutter_app/app/view/mine_view.dart';

const double _kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_MESSAGE = 2;
const int INDEX_MINE = 3;
Color _kPrimaryColor = new Color.fromARGB(255, 0, 215, 198);

class BossApp extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<BossApp> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;
  List<Job> fullTime = Job.fromJson("""
      {
        "list": [
          {
            "name": "CFO",
            "cname": "木间旅游",
            "salary": "25k-50k",
            "username": "代铮",
            "title": "CEO",
            "pub_time": "2019-01-01"
          },
          {
            "name": "财务总监",
            "cname": "安心记加班",
            "salary": "25k-50k",
            "username": "姚笛",
            "title": "创始人 & CEO",
            "pub_time": "2019-01-01"
          },
          {
            "name": "财务经理",
            "cname": "绿谷泰坤堂",
            "salary": "20k-40k",
            "username": "Cici",
            "title": "人事",
            "pub_time": "2019-01-01"
          },
          {
            "name": "财务经理",
            "cname": "智慧芽",
            "salary": "25k-30k",
            "username": "樊燕",
            "title": "招聘者",
            "pub_time": "2019-01-01"
          },
          {
            "name": "品牌财务经理",
            "cname": "京正投资",
            "salary": "20k-25k",
            "username": "李超",
            "title": "招聘者",
            "pub_time": "2019-01-01"
          },
          {
            "name": "架构师（Android）",
            "cname": "蚂蚁金服",
            "salary": "25k-45k",
            "username": "Claire",
            "title": "HR",
            "pub_time": "2019-01-01"
          },
          {
            "name": "资深Android架构师",
            "cname": "今日头条",
            "salary": "40k-60k",
            "username": "Kimi",
            "title": "HRBP",
            "pub_time": "2019-01-01"
          }
        ]
      }
  """);
  List<Job> partTime = Job.fromJson("""
      {
        "list": [
          {
            "name": "CFO",
            "cname": "木间旅游",
            "salary": "25k-50k",
            "username": "代铮",
            "title": "CEO",
            "pub_time": "2019-01-01"
          },
          {
            "name": "财务总监",
            "cname": "安心记加班",
            "salary": "25k-50k",
            "username": "姚笛",
            "title": "创始人 & CEO",
            "pub_time": "2019-01-01"
          },
          {
            "name": "财务经理",
            "cname": "绿谷泰坤堂",
            "salary": "20k-40k",
            "username": "Cici",
            "title": "人事",
            "pub_time": "2019-01-01"
          },
          {
            "name": "财务经理",
            "cname": "智慧芽",
            "salary": "25k-30k",
            "username": "樊燕",
            "title": "招聘者",
            "pub_time": "2019-01-01"
          },
          {
            "name": "品牌财务经理",
            "cname": "京正投资",
            "salary": "20k-25k",
            "username": "李超",
            "title": "招聘者",
            "pub_time": "2019-01-01"
          },
          {
            "name": "架构师（Android）",
            "cname": "蚂蚁金服",
            "salary": "25k-45k",
            "username": "Claire",
            "title": "HR",
            "pub_time": "2019-01-01"
          },
          {
            "name": "资深Android架构师",
            "cname": "今日头条",
            "salary": "40k-60k",
            "username": "Kimi",
            "title": "HRBP",
            "pub_time": "2019-01-01"
          }
        ]
      }
  """);

  @override
  void initState() {
    super.initState();
    _controller =
        new TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new JobsTab(fullTime),
          new JobsTab(partTime),
          new MessageTab(),
          new MineTab()
        ],
        controller: _controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: new TextStyle(fontSize: _kTabTextSize),
          tabs: <IconTab>[
            new IconTab(
                icon: _currentIndex == INDEX_JOB
                    ? "assets/images/ic_main_tab_company_pre.png"
                    : "assets/images/ic_main_tab_company_nor.png",
                text: "全职",
                color: _currentIndex == INDEX_JOB
                    ? _kPrimaryColor
                    : Colors.grey[900]),
            new IconTab(
                icon: _currentIndex == INDEX_COMPANY
                    ? "assets/images/ic_main_tab_contacts_pre.png"
                    : "assets/images/ic_main_tab_contacts_nor.png",
                text: "兼职/实习",
                color: _currentIndex == INDEX_COMPANY
                    ? _kPrimaryColor
                    : Colors.grey[900]),
            new IconTab(
                icon: _currentIndex == INDEX_MESSAGE
                    ? "assets/images/ic_main_tab_find_pre.png"
                    : "assets/images/ic_main_tab_find_nor.png",
                text: "交流",
                color: _currentIndex == INDEX_MESSAGE
                    ? _kPrimaryColor
                    : Colors.grey[900]),
            new IconTab(
                icon: _currentIndex == INDEX_MINE
                    ? "assets/images/ic_main_tab_my_pre.png"
                    : "assets/images/ic_main_tab_my_nor.png",
                text: "我的",
                color: (_currentIndex == INDEX_MINE)
                    ? _kPrimaryColor
                    : Colors.grey[900]),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
      title: "丫财",
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: _kPrimaryColor,
        accentColor: Colors.cyan[300],
      ),
      home: new BossApp()));
}