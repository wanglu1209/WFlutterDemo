import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common_utils/common_utils.dart';

import 'Game.dart';
import 'HeroDetailPage.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> with TickerProviderStateMixin {
  final List<Game> _games = [
    Game('本周新游推荐', '编辑最爱', '点击了解这款游戏', 'images/Zelda.png', """游戏简介
    
欢迎来到竞技场！《部落冲突:皇室战争》将为您带来前所未见的实时卡牌对战体验，在它简单易上手的规则中蕴含著难以计量的深度策略等待您发掘，分秒必争的战局给您源源不绝的刺激体会。

《部落冲突:皇室战争》是由风靡全球的手游《部落冲突》主创成员打造的又一力作。在这里，您可以看到您所钟爱的《部落冲突》中的各色人物以及全新亮相的皇室成员们，除此之外还有更多的惊喜在等着您哦。

您可以收集并升级几十种你所熟知和喜爱的《部落冲突》的军队，法术以及防御建筑卡牌，还有同样令人喜爱的皇室家族人物：王子，骑士，飞龙宝宝等等。您还可以发起对战，打掉对方国王和公主们的皇家塔来获得对战胜利并赢得奖杯，皇冠和荣耀。

您也可以建立或加入一个部落，与部落成员相互捐赠卡牌，打造一个属于自己的独一无二的战斗联盟。

带领您的皇室战争家族赢得胜利吧！

游戏特色

与全世界的玩家进行实时对战，击败他们，赢取奖杯。
解锁宝箱以获得强大的新卡牌，并升级您现有的卡牌。
摧毁对方皇家塔赢得皇冠，获取充满惊喜的皇冠宝箱。
收集皇室战争家族成员和您熟悉的《部落冲突》军队，法术和防御建筑等卡牌，打造和升级您的卡组。
搭配出您的终极出战卡组，一举击败对手。
在各个级别的竞技场上挑战其他玩家，一步步登上颠峰。
建立或加入一个部落，与成员相互捐赠卡牌，打造属于自己独一无二的战斗联盟。
友谊赛模式，向您的部落成员和好友发起挑战。
观看颠峰对决视频，学习顶级玩家的各种对战策略。"""),
    Game('本周战争游戏推荐', '重磅更新', '点击了解这款游戏', 'images/game3.jpg',
        """2009年掌上明珠花费千万重金打造，3G时代飞跃经典之巨作《明珠三国》手机网络游戏，横空出世！展现千年三国风起云涌历史话题，颠覆传统手机游戏产品概念，万人同时在线，还原历史战争风云，各路豪侠英雄聚首《明珠三国》。宏大重磅开场，作为掌上明珠第三代手机网络游戏，备受玩家期待和瞩目！ 

    《明珠三国》为玩家们带来了最正统的三国历史文化背景体验，同时还有丝毫不逊色于PC网络游戏的精美绝伦的画面；超体贴玩家需求，人性化的游戏系统设计；丰富多彩的故事拉动，极强融入感的任务系统设置；《明珠三国》中独树一帜的坐骑、婚姻、官衔、战场、交易、副本等六大系统，构建了血色弥漫、战火硝烟、谋略天下运筹帷幄…我的三国体验，不得不说、不得不玩、不得不纵横驰骋… 

    天下一分为三，三足鼎立，魏蜀吴三国各显特色，场景，地图，任务都不相同，各具千秋。玩家可以在游戏中自由选择魏蜀吴三个国家中任意一名初出茅庐的士兵，在不断的成长旅途中披荆斩棘、除恶惩奸；结识友人、邂逅浪漫；完成梦想、成就伟业！并有机会与三国中的诸位英雄人物同场竞技、切磋技艺、一决高下！在《明珠三国》中，完全属于您的新英雄宏辉诗歌篇章即将开始谱写，引领新三国的历史狂潮！"""),
    Game('蜘蛛侠 屌的一批', '编辑喜欢玩', '全新资料片', 'images/game2.png',
        """战地风暴》（invision）是成都Tap4Fun推出的战争策略手游，荣获App Store官方推荐！游戏主旨围绕着打造最强基地-战胜敌人而展开，玩家在游戏中需要培养自己的基地建筑、同时最大化资源优势、生产足够多的武装力量，从而使自己的基地成为最强的军事堡垒。基地到达一定等级后，还可与其他玩家结成联盟，进行联盟间的战斗，实时交流、互助，体验协同战斗的乐趣！除此之外，《战地风暴》所独有的高清3D画面表现力，将重现现代战争中炮火纷飞的激烈战场。这是一场发生在人与人之间，真实的线上战争！



加入《战地风暴》，体验最真实的3D现代战争手游！全球同服，为国而战，目前中国军团紧急招募中...

RTS RPG与SLG结合的创新玩法，精致写实的画风，逼真的军事装备，气势恢宏的场景，面对列强外敌的入侵和挑衅！

《战地风暴》支持16种语言，全球同服，您可以和全球玩家聊天交友；实时语音翻译系统，助您与全球玩家无障碍交流；团结本国玩家建立国家联盟，对抗其他国家的入侵，体验最激烈、最真实的实时线上军事大战！



游戏特色

1、招募战友，组建中国最强军团

• 组建联盟，招募军团

• 联盟互助，团结对外

• 远交近攻，策略制胜

2、争夺领土，对抗列强外敌入侵

• 重建基地，管理资源

• 研究武器，训练军队

• 争夺领土，对抗列强

3、全球同服，为中国崛起而战

• 多国同服，真人对战

• 实时翻译，语音沟通

• 聊天交友，探讨策略"""),
    Game('今日APP', '重磅推荐', '点击了解这个APP', 'images/game1.jpg', """中文名称：《功夫世界》
游戏类型：全3D动态平衡型武侠MMOPRG
游戏主题：中国古典武侠。
画面风格：3D画面表现，艳丽明快，唯美风格。
游戏视角：全3D画面，第三人称斜视角鸟瞰视野

《功夫世界》是腾仁信息秉承一贯的运营理念和专业精神，集公司成立三年以来的运营和研发经验，为所有中国玩家精心打造的代表国产顶尖网游研发水准的网游大作。这将是一款由中国一流游戏开发团队自主研发时间超过3年，投入资金数千万元。将国际级研发水准与中国纯正武侠文化完美融合的全3D纯正武侠网络游戏产品。

《功夫世界》是一款领衔新一代中国武侠网游的巅峰之作，将带给所有喜爱武侠文化的中国玩家纯正的江湖感受。在极力打造游戏武侠文化特质的基础之上，《功夫世界》将呈现更多契合现代社会和中国玩家需求的创造性内容，让现代玩家能充分体验高度拟真的江湖世界。"""),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${DateUtil.getDateStrByDateTime(
                                DateTime.now(),
                                format: DateFormat.ZH_MONTH_DAY,
                              )} ${DateUtil.getZHWeekDay(DateTime.now())}',
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.none,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Today',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipOval(
                        child: Image.network(
                          'https://img2.woyaogexing.com/2019/05/23/e676568c6c684b04ab828a568c76f32b!400x400.jpeg',
                          width: 50,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                ),
                createListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createListView() {
    return ListView.builder(
      itemCount: _games.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return createItemView(index);
      },
    );
  }

  Widget createItemView(int index) {
    var game = _games[index];
    var _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    var _animation =
    Tween<double>(begin: 1, end: 0.98).animate(_animationController);
    return GestureDetector(
      onPanDown: (details) {
        print('onPanDown');
        _animationController.forward();
      },
      onPanCancel: () {
        print('onPanCancel');
        _animationController.reverse();
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) {
                return HeroDetailPage();
              },
              fullscreenDialog: true,
              settings: RouteSettings(arguments: game)),
        );
        print('onTap');
      },
      child: Container(
          height: 450,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ScaleTransition(
            scale: _animation,
            child: Hero(
              tag: 'hero${game.title}',
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        game.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          game.headText,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            game.title,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Text(
                          game.footerText,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
