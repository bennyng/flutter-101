import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:kaios_store_client/api/api.dart';
import 'package:kaios_store_client/domain/app_items/app_item_model.dart';

class MockApi implements KaiStoreApi {
  List<AppItem> _mockAppItems;

  @override
  Future<ApiCollectionResponse<AppItem>> fetchAppItems({
    @required String audienceCode,
    @required int page,
    @required int pageSize,
  }) async {
    // mimic server loading
    await Future.delayed(Duration(milliseconds: 200));

    var start = min((page - 1) * pageSize, mockAppItems.length);
    var end = min((page) * pageSize, mockAppItems.length);

    // TODO: dummy structure for handling different shape of response

    if (audienceCode == 'apple') {
      return Future.value(
        ApiCollectionResponse(
          items: mockAppItems.sublist(start, end),
          totalCount: mockAppItems.length,
        ),
      );
    }

    if (audienceCode == 'banana') {
      return Future.value(
        ApiCollectionResponse(
          items: mockAppItems.sublist(start, end),
          totalCount: mockAppItems.length,
        ),
      );
    }

    throw "Server not handling audienceCode $audienceCode";
  }

  List<AppItem> get mockAppItems {
    if (this._mockAppItems == null) {
      this._mockAppItems = this._generateMockAppItems();
    }
    return this._mockAppItems;
  }

  List<AppItem> _generateMockAppItems() {
    var seed = [
      AppItem(
        appId: 'com.nintendo.zaka',
        name: 'Mario Kart Tour',
        headline: 'Mario Kart takes a world tour!',
        description:
            """Mario and friends go global in this new Mario Kart as they race around courses inspired by real-world cities in addition to classic Mario Kart courses! These destinations will be featured in tours that rotate every two weeks! In addition to courses based on iconic locales, some of your favourite Mario Kart characters will get variations that incorporate the local flavour of cities featured in the game!""",
        iconSmallURL:
            'https://lh3.googleusercontent.com/BtZ7yFEWMfDbgEslLJMjMRiVu_K4LE-Y8BLDsTc8n9HCZJs4QKLKbyIi7GBO5f33hA=s256-rw',
        iconMediumURL:
            'https://lh3.googleusercontent.com/BtZ7yFEWMfDbgEslLJMjMRiVu_K4LE-Y8BLDsTc8n9HCZJs4QKLKbyIi7GBO5f33hA=s256-rw',
        iconLargeURL:
            'https://lh3.googleusercontent.com/GIVfqv-smMQwlbwTH-6vmZ-yZ0UT7LPfNuc0mONpLmljrXVArQ2T8mPQEb3KY1O93svA=s360-rw',
      ),
      AppItem(
        appId: 'com.ea.game.simcitymobile_row',
        name: 'SimCity BuildIt',
        headline: 'BRING YOUR CITY TO LIFE',
        description:
            """Welcome, Mayor! Be the hero of your very own city as you design and create a beautiful, bustling metropolis. Every decision is yours as your city gets larger and more intricate. Make smart choices to keep your citizens happy and your skyline growing. Then trade, chat, compete, and join clubs with fellow Mayors. Build your way to extraordinary with the most popular city builder on mobile!""",
        iconSmallURL:
            'https://lh3.googleusercontent.com/xeueLEGFJLlO68AOvgVNeB0qTMk-AFymX0qmc9s1CZb7mrUh3UbbTHSKsbFjZ-JEB5Pt=s256-rw',
        iconMediumURL:
            'https://lh3.googleusercontent.com/xeueLEGFJLlO68AOvgVNeB0qTMk-AFymX0qmc9s1CZb7mrUh3UbbTHSKsbFjZ-JEB5Pt=s256-rw',
        iconLargeURL:
            'https://lh3.googleusercontent.com/xeueLEGFJLlO68AOvgVNeB0qTMk-AFymX0qmc9s1CZb7mrUh3UbbTHSKsbFjZ-JEB5Pt=s256-rw',
      ),
      AppItem(
        appId: 'com.skype.m2',
        name: 'Skype Lite',
        headline: 'Free Video Call & Chat',
        description:
            """Skype Lite is the new Skype built for India to meet your daily messaging and video communication needs. It is small, fast, and capable. It lets you send free text messages and make voice & video calls even under limited network conditions. Skype Lite will always help you stay connected with your friends and family.""",
        iconSmallURL:
            'https://lh3.googleusercontent.com/Tqgy9wddo_e_IegqVDAiYfPcWg0iXESll_DvU2yDfdJQCj-gzWcGOnO9tb_WY-dEUuY=s256-rw',
        iconMediumURL:
            'https://lh3.googleusercontent.com/Tqgy9wddo_e_IegqVDAiYfPcWg0iXESll_DvU2yDfdJQCj-gzWcGOnO9tb_WY-dEUuY=s256-rw',
        iconLargeURL:
            'https://lh3.googleusercontent.com/Tqgy9wddo_e_IegqVDAiYfPcWg0iXESll_DvU2yDfdJQCj-gzWcGOnO9tb_WY-dEUuY=s360-rw',
      ),
      AppItem(
        appId: 'com.skype.m2',
        name: 'edX',
        headline: 'Online Courses by Harvard, ANU, UQ, MIT, IBM',
        description: """edX is your trusted platform for education and learning.

Founded by Harvard university and MIT, edX is home to more than 20 million learners, the majority of top-ranked universities in the world, and industry-leading companies, offering 2000+ online courses.

Learn and master in-demand skills to advance your career with certificate programs and online courses in the fastest-growing fields: computer science and programming, data science, software engineering, business, management, marketing, finance, accounting, math, design, cybersecurity, power bi, and more. Expand your horizons and further your education with online classes from top universities such as Australian National University and more. Make edX your personal online college. From data science courses to project management courses, edX has you covered.""",
        iconSmallURL:
            'https://lh3.googleusercontent.com/vnEySZNSljFkEacOjcVlQgJhP6ZaVBsD6KXbNyL_CZ8Hrc-saszstKtxh_HJezzPqw=s256-rw',
        iconMediumURL:
            'https://lh3.googleusercontent.com/vnEySZNSljFkEacOjcVlQgJhP6ZaVBsD6KXbNyL_CZ8Hrc-saszstKtxh_HJezzPqw=s360-rw',
        iconLargeURL:
            'https://lh3.googleusercontent.com/vnEySZNSljFkEacOjcVlQgJhP6ZaVBsD6KXbNyL_CZ8Hrc-saszstKtxh_HJezzPqw=s360-rw',
      ),
      AppItem(
        appId: 'com.supercell.brawlstars',
        name: 'Brawl Stars',
        headline:
            'Fast-paced multiplayer battles from the makers of Clash of Clans, Clash Royale and Boom Beach.',
        description:
            """Battle with friends or solo across a variety of game modes in under three minutes. Unlock and upgrade dozens of Brawlers with powerful super abilities. Purchase and collect unique skins to stand out and show off in the arena. Join or start a band to share tactics and fight together.

BATTLE IN MULTIPLE GAME MODES
- Gem Grab (3v3): Team up and out-strategize the opposing team. Collect and hold 10 gems to win, but get fragged and lose your gems.
- Showdown (Solo/Duo): A battle royale style fight for survival. Collect power ups for your Brawler. Grab a friend or play solo - be the last Brawler standing in the rowdiest battle royale yet. Winner take all!
- Bounty (3v3): Take out opponents to earn stars, but don’t let them pick you off. The squad with the most stars wins the match!
- Heist (3v3): Protect your team’s safe and try to crack open your opponents’. Navigate the map to sneak, blast and blow your way clear to the enemies treasure.
- Brawl Ball (3v3): It's a whole new Brawl game! Show off your soccer/football skills and score two goals before the other team. There are no red cards here.
- Special Events: Limited time special PvE and PvP game modes.

UNLOCK AND UPGRADE BRAWLERS
Collect and upgrade a variety of Brawlers with punishing SUPER abilities, level them up with power points, and collect unique skins.

BECOME THE STAR PLAYER
Climb the local and regional leaderboards to prove you’re the greatest Brawler of them all!

CONSTANTLY EVOLVING
Look out for new Brawlers, skins, maps, special events and games modes in the future.

PLEASE NOTE! Brawl Stars is free to download and play, however, some game items can also be purchased for real money. If you don't want to use this feature, please disable in-app purchases in your device's settings. Also, under our Terms of Service and Privacy Policy, you must be at least 13 years of age to play or download Brawl Stars.

Features:
- Team up for real-time 3v3 battles against players from across the world
- A fast-paced multiplayer battle royale mode made for mobile
- Unlock and collect new, powerful Brawlers - each with a signature attack and SUPER ability
- New events and game modes daily
- Battle solo or co-op
- Climb to the top of the leaderboards in global and local rankings
- Join or start your own Club with fellow players to share tips and battle together
- Customize Brawlers with unlockable skins
- Player-designed maps offer challenging new terrain to master

Support
Are you having problems? Visit http://supercell.helpshift.com/a/brawl-stars/ or contact us in game by going to Settings > Help and Support.

Privacy Policy:
http://supercell.com/en/privacy-policy/

Terms of Service:
http://supercell.com/en/terms-of-service/

Parent’s Guide:
http://supercell.com/en/parents/""",
        iconSmallURL:
            'https://lh3.googleusercontent.com/omP5uZRKPNpiMUzXxU64s7HzbDo6VGGgAIfzEv9Wv7W4J89rPHeuiu5JRKvUXBpi0U0=s256-rw',
        iconMediumURL:
            'https://lh3.googleusercontent.com/omP5uZRKPNpiMUzXxU64s7HzbDo6VGGgAIfzEv9Wv7W4J89rPHeuiu5JRKvUXBpi0U0=s256-rw',
        iconLargeURL:
            'https://lh3.googleusercontent.com/omP5uZRKPNpiMUzXxU64s7HzbDo6VGGgAIfzEv9Wv7W4J89rPHeuiu5JRKvUXBpi0U0=s360-rw',
      ),
    ];
    Random random = Random();
    return List.generate(300, (_) => seed[random.nextInt(seed.length)]);
  }
}
