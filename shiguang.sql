
create database shiguangshe charset utf8;
use shiguangshe;

SET NAMES GBK;

菜谱：
1.菜种类表(dish_kind)：kid菜系种类， id， kname菜系名称

create table dish_kind(
	id     INT PRIMARY KEY AUTO_INCREMENT,
	kid    INT,
	kname  VARCHAR(100)
);
SET NAMES GBK;
INSERT INTO dish_kind VALUES(null,10,"家常菜");
INSERT INTO dish_kind VALUES(null,20,"川菜");
INSERT INTO dish_kind VALUES(null,30,"粤菜");
INSERT INTO dish_kind VALUES(null,40,"湘菜");


2.菜谱详情表(dish)：kid菜系种类，did菜品编号，dname菜品名称，dinfo菜品简介，dpic菜品图片,dmaterial原料，
                    dstep1,step1_p,dstep2,step2_p,dstep3,step3_p,dstep4,step4_p,dstep5,step5_p

create table dish(
	did       INT PRIMARY KEY AUTO_INCREMENT,
	kid       INT,
	dname     VARCHAR(100),
	dinfo     VARCHAR(500),
	dpic   VARCHAR(100),
	dmaterial VARCHAR(500),
	dstep1    VARCHAR(200),
	dstep1_p  VARCHAR(100),
	dstep2    VARCHAR(200),
	dstep2_p  VARCHAR(100),
	dstep3    VARCHAR(200),
	dstep3_p  VARCHAR(100),
	dstep4    VARCHAR(200),
	dstep4_p  VARCHAR(100),
	dstep5    VARCHAR(200),
	dstep5_p  VARCHAR(100)
);

INSERT INTO dish VALUES(null,20,"回锅肉","回锅肉是一道没有南北地域的，比较有名的传统的菜肴，也是百姓餐桌上最爱欢迎的一道家常菜。",
"image/list/7- (2).png","五花肉550克,豆瓣酱1大勺,蒜苗2棵,生抽1小勺,精盐1/4勺,白皮蒜4片,姜1小块,花椒少许,青椒1个,红椒1个。",
"五花肉洗净冷水下锅加入花椒和生姜","image/list/7- (1).jpg","煮开撇去浮沫煮熟捞出","image/list/7- (2).jpg","把配料切好备用",
"image/list/7- (3).jpg","加入姜，蒜蓉翻炒一下","image/list/7- (6).jpg","加入蒜苗继续翻炒至蒜苗断生即可","image/list/7- (10).jpg");

INSERT INTO dish VALUES(null,10,"简单快手馄饨面","有虾的鲜嫩和肉的美味，汤汁都变得很美味",
"image/list/8- (2).jpg","馄饨20个、挂面一把,生抽适量、盐适量、鸡精适量、葱花适量",
"先准备原材料，如图所示","image/list/8- (3).jpg","去虾线","image/list/8- (4).jpg","水烧开后先放入馄饨",
"image/list/8- (5).jpg","再放入面条","image/list/8- (6).jpg","调入生抽和盐，还有鸡精调味，出锅前撒葱花即可","image/list/8- (2).jpg");

INSERT INTO dish VALUES(null,30,"京酱鸡蛋","零厨艺懒人夏日必备京酱鸡蛋。",
"image/list/9- (1).jpg","豆腐皮1张、鸡蛋6个,白糖适量、色拉油适量、葱一小根、香油少许、白酒一汤匙、食盐少许、甜面酱一勺",
"买来的豆腐皮用开水汆烫两次，然后冲洗干净、切成大小合适的方块，用来包鸡蛋用。大葱洗净切成葱丝","image/list/9- (3).jpg",
"鸡蛋打入碗中，加入适量水搅打，加入适量盐和几滴白酒，搅打成均匀的蛋液","image/list/9- (5).jpg",
"锅中放一大勺油，油热后，将蛋液倒入，等蛋液微微凝固转中小火，将蛋液炒成鸡蛋快，然后铲出",
"image/list/9- (4).jpg","锅里放适量油，将甜面酱倒入锅中，小火慢慢炒酱，加入一勺糖、加入一勺香油，慢慢炒至酱液粘稠，将事先炒好的鸡蛋放入，酱和蛋翻炒均匀即可",
"image/list/9- (2).jpg","京酱鸡蛋成品图","image/list/9- (4).jpg");

INSERT INTO dish VALUES(null,40,"土豆红烧肉","土豆红烧肉是一道没有南北地域的，比较有名的传统的菜肴，也是百姓餐桌上最爱欢迎的一道家常菜。",
"image/list/10- (5).jpg","五花肉650克、土豆1个,葱1段、姜3片、八角1个、草果1个、香叶1片、茴香籽2克、花椒3克、番茄酱20克、植物油30克、黄酒15克、食盐5克、生抽15克、老抽10克、冰糖10克、水适量",
"五花肉洗净切块，土豆去皮洗净，切小块","image/list/10- (1).jpg",
"五花肉冷水下锅，加一勺黄酒，几粒花椒，焯水","image/list/10- (2).jpg",
"热锅冷油，放番茄酱炒出红油，倒入焯好的五花肉",
"image/list/10- (3).jpg","小火煸炒至五花肉上色，调入黄酒、盐、生抽、老抽和冰糖",
"image/list/10- (4).jpg","大火烧开，转小火盖上盖子慢炖一小时左右，倒入土豆","image/list/10- (5).jpg");

INSERT INTO dish VALUES(null,10,"香烤鱿鱼包饭","鱿鱼放入白醋水里浸泡，就能 能很轻易将表面的皮去掉糯米饭不用装太满哦。烤的时候会有点涨",
"image/list/11- (1).jpg","鱿鱼一只、糯米半碗,生抽一勺、剁辣椒一小勺、青豆一把、胡萝卜半个",
"盆里放几滴白醋，将鱿鱼放进去浸泡十分钟左右","image/list/11- (2).jpg",
"糯米饭隔水蒸熟","image/list/11- (3).jpg",
"将两种蔬菜放入锅里汆烫",
"image/list/11- (4).jpg","将炒好的糯米饭装进去",
"image/list/11- (5).jpg","将处理好的鱿鱼放入空气炸锅，230度烤十分钟,出锅，稍微冷却下，切成段即可","image/list/11- (6).jpg");

INSERT INTO dish VALUES(null,20,"鱼香肉丝","鱼香肉丝这个菜可以说是中国菜里的高难度，与<海阔天空>是绝配，一样的大气，一样的华丽，一样的让人回味",
"image/list/12- (3).jpg","猪里脊肉300克,小葱2棵、姜2片、泡红椒10克、食盐3克、白糖25克、米醋20克、料酒10克、酱油15克、植物油50克、淀粉15克、蒜6瓣",
"通脊片成片然后码放整齐准备切丝，如果有时候可以冻一下，然后再切丝会非常好切而且会非常工整","image/list/12- (4).jpg",
"然后加少许盐和料酒腌下，再放蛋清抓匀，最后放干淀粉，然后放少许油封住，这样肉丝不会脱浆","image/list/12- (1).jpg",
"泡红椒去籽剁碎，越烂越好，然后葱姜蒜切米备用，冬笋切和肉丝差不多的丝，木耳切丝，冬笋和木耳开水焯一下，沥干水备用",
"image/list/12- (2).jpg","重中之重，味汁（料酒10克、米醋20克、白糖25克、盐一点点、酱油15克、淀粉15克），记住汁量不可大，不然炒出来汤汁太多，油稍多些，五成热时下泡椒和浆好的肉丝炒开，如果不好炒用筷子划拉，炒开立刻放葱姜蒜炒香，然后放入焯过的冬笋丝和木耳丝，最后倒入味汁，再炒几下就可以了",
"image/list/12- (3).jpg","鱼香肉丝成品图","image/list/12- (3).jpg");

INSERT INTO dish VALUES(null,40,"剁椒鱼头","剁椒鱼头属湘菜系，是湘潭的一道名菜。以鱼头的“味鲜”和剁辣椒的“辣”为一体，风味独具一格。",
"image/list/13- (1).jpg","鲢鱼1条，食盐2克、料酒8克、葱10克、姜10克、蒜5克、剁椒100克、植物油1勺",
"鲢鱼去鳞去鳃去内脏，清洗干净，沥干水分，取下鱼头，沿鱼脊骨纵向剁开，背部相连","image/list/13- (2).jpg",
"用盐和料酒涂均匀抹鱼头正反面，腌制10分钟后，再次冲洗干净，彻底沥干水分，鱼盘底部铺上葱姜，鱼头展开，平铺进盘","image/list/13- (3).jpg",
"取适量剁椒剁碎，剁椒铺在鱼头上面，坐锅烧水，水开后放入鱼盘大火蒸制8分钟",
"image/list/13- (4).jpg","开锅撒上姜蒜末(这步可以添加适量蒸鱼豉油)，继续蒸2分钟",
"image/list/13- (5).jpg","取出撒上葱碎，烧一勺热油，趁热浇在鱼身上","image/list/13- (1).jpg");

INSERT INTO dish VALUES(null,40,"干锅菜花","湘菜馆的干锅菜花焦香爽脆，是超人气的下饭菜，当然，来扎啤酒就更给力了。",
"image/list/14- (3).jpg","菜花500克，五花肉100克、红尖椒2个，姜4片、蒜5克、食盐1.5小勺、酱油2勺",
"菜花冲洗干净后用小刀沿着柄削成小朵，用淡盐水浸泡10分钟，冲洗干净后充分晾干水分","image/list/14- (6).jpg",
"五花肉切片、酱油一勺，红尖椒切圈、生姜切片，大蒜拍散后切小块","image/list/14- (4).jpg",
"五花肉入锅加生姜，小火慢慢煽炒出油，将肉推至一边",
"image/list/14- (2).jpg","开大火，倒入菜花，略停30秒再翻炒几下，盖上锅盖，调中火焗30秒，这时候可以看出菜花头都有点焦色了",
"image/list/14- (1).jpg","加入红尖椒和大蒜碎，炒匀后加入一勺酱油，翻炒均匀，起锅前加入一小勺盐炒匀即可","image/list/14- (5).jpg");

INSERT INTO dish VALUES(null,10,"蚂蚁上树","蚂蚁上树是中国四川和重庆地区常见的食品，用粉丝和肉末加辣豆瓣酱炒。",
"image/list/15- (2).jpg","猪肉馅100克、粉丝100克，细香葱2根、姜3片、豆瓣辣酱1汤匙、白糖1/4茶匙、生抽1茶匙、植物油1汤匙、水100毫升",
"锅内入油，爆香葱姜后倒入肉末煽炒出油来","image/list/15- (6).jpg",
"调入1大勺辣豆瓣酱，翻炒匀","image/list/15- (1).jpg",
"往锅内倒入100毫升的清水",
"image/list/15- (5).jpg","调入白糖、生抽拌匀",
"image/list/15- (4).jpg","倒入泡软的粉丝，翻炒至汤汁收干，撒上葱花炒匀即可","image/list/15- (3).jpg");

INSERT INTO dish VALUES(null,30,"梅菜扣肉","这个菜是广东比较出名的一道菜，用的是梅干菜当陪衬，特别和谐，梅菜相当于和四川的冬菜芽菜差不多的一种干菜，只是味道比较绵厚",
"image/list/16- (4).jpg","五花肉500克、梅菜100克，柱侯酱30克、生抽10克、老抽2克、蚝油10克、腐乳(红)半块、白糖10克、黄酒10克、葱5克、姜5克、小葱5克、色拉油适量",
"梅菜用水泡上，洗两次，把土和渣子洗一下，不用洗太干净，不然味道跑了","image/list/16- (5).jpg",
"煮肉，放点葱姜，大火烧开，小火煮九成熟，肉煮好后捞出来趁热表面抹上老抽","image/list/16- (2).jpg",
"坐油到八成热，放肉皮朝下进去炸，尽量都炸到位，切成大片，薄厚凭喜好自己掌握，然后把所有调料（柱候酱、生抽、老抽、蚝油、红腐乳、白糖、黄酒）全加进去拌匀",
"image/list/16- (3).jpg","找一个碗，肉皮朝下码好，然后把泡好的梅菜挤干水放在上边弄整齐了，如果还有剩下的汁酱就全浇上去",
"image/list/16- (1).jpg","上锅蒸至少一小时，高压锅二十分钟差不多了，蒸熟后倒扣到碗中，洒少许香葱，即可享用","image/list/16- (4).jpg");

INSERT INTO dish VALUES(null,20,"水煮肉片","水煮的特色是“麻、辣、鲜、烫”，水煮类的菜一直以来就是一道长盛不衰的菜",
"image/list/17- (3).jpg","猪里脊肉400克，花椒粉1勺、辣椒粉1勺、辣椒酱1勺、酱油1勺、胡椒粉1勺、水淀粉1汤勺、植物油1汤勺、花椒1小把、小葱2根、大蒜3瓣、料酒1小勺、食盐3克",
"猪里脊肉可以略微冻一下，取出切大薄片，肉片加蛋清、盐、少许酱油、料酒、水淀粉等抓匀（要想肉嫩的窍门就是加入少许清水抓匀，这就是上浆。最后很关键，肉内加入少许油拌匀，有条件放入冰箱冷冻一会，可以防止一会脱浆）",
"image/list/17- (4).jpg",
"大白菜洗净撕小块，锅中放几滴油，放入白菜盖上锅盖，少油低温炒一下","image/list/17- (5).jpg",
"锅中放油烧热，煸香花椒捞出，放入葱花煸炒出香味，放入剁得很碎的辣椒酱继续煸炒",
"image/list/17- (1).jpg","加入水或者高汤、酱油、胡椒粉煮开调味，放入腌渍好的肉片，将肉片慢慢滑散断生，立刻关火（千万不要煮太久，以免肉质变老）",
"image/list/17- (6).jpg","菜铺在碗的底部，捞出肉片放在白菜上并倒上汤汁；然后撒上花椒面，菜铺在碗的底部，捞出肉片放在白菜上并倒上汤汁；然后撒上花椒面","image/list/17- (2).jpg");

INSERT INTO dish VALUES(null,30,"糖醋排骨","在腌制排骨时间上可以是20分钟，也可以是几个小时甚至一整晚，若想吃入味的，还是需要耐心的哈",
"image/list/18- (4).jpg","猪大排适量，米醋适量、白砂糖适量、姜适量、小葱适量、生抽适量、老抽适量、食盐适量、色拉油适量",
"肋骨洗干净，用生抽、姜丝、盐、油腌制，放冰箱一晚","image/list/18- (3).jpg",
"下油热平底锅，把肋排平放，慢火煎至两面金黄色，放少许老抽上色","image/list/18- (2).jpg",
"另用一锅放入适量的开水，放入白米醋、白砂糖，放入煎好的排骨，（水需没过排骨）中火炖煮40分钟至排骨肉质酥香，大火收汁,撒点香葱即可",
"image/list/18- (1).jpg","糖醋排骨成品图",
"image/list/18- (4).jpg","糖醋排骨成品图","image/list/18- (4).jpg");


3.用户表(userlist):uid，uname昵称,uaccount账号名,upwd,upic,uaddr收货地址

create table userlist(
    uid      INT PRIMARY KEY AUTO_INCREMENT,
    uname    VARCHAR(100),
    uaccount VARCHAR(100),
    upwd     VARCHAR(100),
    upic     VARCHAR(100),
    uaddr    VARCHAR(100),
    uphone   VARCHAR(100)
);

SET NAMES GBK;
INSERT INTO userlist VALUES(null,"爱美食的志宝妈","zhibao","123456","image/user/1.jpg","文博大厦","13841878461");
INSERT INTO userlist VALUES(null,"公主家的笨笨","benben","123456","image/user/2.jpg","朝阳区","13841878461");
INSERT INTO userlist VALUES(null,"Hellobaby你好宝贝","baby","123456","image/user/3.jpg","万寿路","13841878461");
INSERT INTO userlist VALUES(null,"七十二变小菊子","xiaojuzi","123456","image/user/4.jpg","公主坟","13841878461");


4.商品分类表(classify):id,cid商品种类，cname商品种类名称

create table classify(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    cname  VARCHAR(100),
    cid    INT
);
SET NAMES GBK;
INSERT INTO classify VALUES(null,"粮油",1);
INSERT INTO classify VALUES(null,"烘焙",2);
INSERT INTO classify VALUES(null,"水果",3);


5.商品表(product):pid 商品编号，pname 商品名，pprice 商品价格,pstandard 商品规格，pinfo 商品简介，ppic,ppic1,
                            ppic2,ppic3,ppic4,ppic5,ppic6,ppic7,ppic8

create table product(
    pid        INT PRIMARY KEY AUTO_INCREMENT,
    pname      VARCHAR(100),
    pprice     DOUBLE(8,2),
    pstandard  VARCHAR(100),
    pinfo      VARCHAR(100),
    ppic       VARCHAR(100),
    ppic1      VARCHAR(100),
    ppic2      VARCHAR(100),
    ppic3      VARCHAR(100),
    ppic4      VARCHAR(100),
    ppic5      VARCHAR(100),
    cid        INT
);
SET NAMES GBK;
INSERT INTO product VALUES(null,'百钻中筋小麦面粉',5,'百钻中筋小麦面粉 500g','粉质细腻又筋道，中式面点就用它','image/product/1.jpg',
'image/product/1-lg (1).jpg','image/product/1-lg (2).jpg','image/product/1-lg (3).jpg','image/product/1-lg (4).jpg','image/product/1-lg (5).jpg',2);
INSERT INTO product VALUES(null,'鑫维德蛋挞液',16,'鑫维德蛋挞液500g','奶香浓郁，烤出零失败的蛋挞','image/product/2.jpg',
'image/product/2-lg (1).jpg','image/product/2-lg (2).jpg','image/product/2-lg (3).jpg','image/product/2-lg (4).jpg','image/product/2-lg (5).jpg',2);
INSERT INTO product VALUES(null,'中英面包糠面包屑',6,'中英面包糠面包屑 200g','油炸食物的黄金外衣，吸油更少更健康','image/product/3.jpg',
'image/product/3-lg (1).jpg','image/product/3-lg (2).jpg','image/product/3-lg (3).jpg','image/product/3-lg (4).jpg','image/product/3-lg (5).jpg',2);
INSERT INTO product VALUES(null,'玛丽苏奶酪',15,'玛丽苏奶酪 500g','粉质细腻又筋道，香甜可口','image/product/4.jpg',
'image/product/4-lg (1).jpg','image/product/4-lg (2).jpg','image/product/4-lg (3).jpg','image/product/4-lg (4).jpg','image/product/4-lg (5).jpg',2);
INSERT INTO product VALUES(null,'秘制卤肉香料包',6.8,'秘制卤肉香料包 50g','一包料卤出记忆中的肉香','image/product/5.jpg',
'image/product/5-lg (1).jpg','image/product/5-lg (2).jpg','image/product/5-lg (3).jpg','image/product/5-lg (4).jpg','image/product/5-lg (5).jpg',1);
INSERT INTO product VALUES(null,'四川麻婆豆腐调料',9.8,'四川麻婆豆腐调料 80g*2','麻辣烫香才敢说是正宗麻婆味儿。','image/product/6.jpg',
'image/product/6-lg (1).jpg','image/product/6-lg (2).jpg','image/product/6-lg (3).jpg','image/product/6-lg (4).jpg','image/product/6-lg (5).jpg',1);
INSERT INTO product VALUES(null,'火鸡面拌面',27.9,'火鸡面拌面140g*5袋','欧巴们都抗拒不了的鲜辣滋味','image/product/7.jpg',
'image/product/7-lg (1).jpg','image/product/7-lg (2).jpg','image/product/7-lg (3).jpg','image/product/7-lg (4).jpg','image/product/7-lg (5).jpg',1);
INSERT INTO product VALUES(null,'红豆+薏米养生组合',19.8,'红豆+薏米养生组合','粉质细腻，养颜祛湿好冲泡','image/product/8.jpg',
'image/product/8-lg (1).jpg','image/product/8-lg (2).jpg','image/product/8-lg (3).jpg','image/product/8-lg (4).jpg','image/product/8-lg (5).jpg',1);
INSERT INTO product VALUES(null,'南非进口 红心西柚',15.8,'南非进口 红心西柚 2个装','麻辣烫香才敢说是正宗麻婆味儿。','image/product/9.jpg',
'image/product/9-lg (1).jpg','image/product/9-lg (2).jpg','image/product/9-lg (3).jpg','image/product/9-lg (4).jpg','image/product/9-lg (5).jpg',3);
INSERT INTO product VALUES(null,'海南红心木瓜',10.8,'海南红心木瓜 80g*2','就是这个味，营养丰富','image/product/10.jpg',
'image/product/10-lg (1).jpg','image/product/10-lg (2).jpg','image/product/10-lg (3).jpg','image/product/10-lg (4).jpg','image/product/10-lg (5).jpg',3);
INSERT INTO product VALUES(null,'百香果',35,'百香果18颗装','吃到百种水果的酸甜。','image/product/11.jpg',
'image/product/11-lg (1).jpg','image/product/11-lg (2).jpg','image/product/11-lg (3).jpg','image/product/11-lg (4).jpg','image/product/11-lg (5).jpg',3);
INSERT INTO product VALUES(null,'陕西周至奇异果',30.8,'陕西周至奇异果15个 5斤左右','陕西周至奇异果,包邮 现摘现发','image/product/12.jpg',
'image/product/12-lg (1).jpg','image/product/12-lg (2).jpg','image/product/12-lg (3).jpg','image/product/12-lg (4).jpg','image/product/12-lg (5).jpg',3);


6,订单表(order_list):oid订单编号，(pname 商品名)，uid 用户编号，order_time 订餐时间,(ppic_sm,)pid 商品编号，ocount 商品数量。

create table order_list(
    oid         INT PRIMARY KEY AUTO_INCREMENT,
    pname       VARCHAR(100),
    uid         INT,
    order_time  DATETIME,
    ppic_sm     VARCHAR(100),
    pid         INT,
    ocount      INT
);


INSERT INTO order_list VALUES(null,'百钻中筋小麦面粉',1,now(),'image/product/1.jpg',1,2);
INSERT INTO order_list VALUES(null,'陕西周至奇异果',3,now(),'image/product/12.jpg',2,12);

7.饭范表(talk):tid ,tinfo 发表简介，ttime 发表时间，tpic_lg,tpic1,tpic2,tpic3,tpic4,tpic5,tpic6

create table talk(
    tid       INT PRIMARY KEY AUTO_INCREMENT,
    tinfo     VARCHAR(100),
    ttime     DATETIME,
    tpic_lg   VARCHAR(100),
    tpic1     VARCHAR(100),
    tpic2     VARCHAR(100),
    tpic3     VARCHAR(100),
    tpic4     VARCHAR(100),
    tpic5     VARCHAR(100),
    tpic6     VARCHAR(100)
);
SET NAMES GBK;
INSERT INTO talk VALUES(null,
"美味调剂生活这几天看别人吃螺蛳粉眼馋了，于是买回来自己煮，吃一碗下肚，好过瘾呵。吃完螺蛳粉，再来一盘芒果，可以缓解一下螺蛳粉的辣",
now(),"image/discuss/2- (2).jpg","image/discuss/2- (2).jpg","image/discuss/2- (3).jpg","image/discuss/2- (4).jpg",
"image/discuss/2- (5).jpg","image/discuss/2- (6).jpg","image/discuss/2- (7).jpg");
INSERT INTO talk VALUES(null,
"7.11 早餐#：早上先做的肉末炸酱面、鲜榨的哈密瓜汁、牛肉咖喱豆腐汤还没熬好就开吃了!",
now(),"image/discuss/2- (54).jpg","image/discuss/2- (54).jpg","image/discuss/2- (55).jpg","image/discuss/2- (56).jpg",
"image/discuss/2- (57).jpg","image/discuss/2- (58).jpg","image/discuss/2- (59).jpg");
INSERT INTO talk VALUES(null,
"#宝宝早餐不重样#葱油拌面+水煮西蓝花+鸡蛋醪糟+油桃参考月龄：18个月以上「迎着生活前行，做好当下的事」早安",
now(),"image/discuss/2- (23).jpg","image/discuss/2- (23).jpg","image/discuss/2- (24).jpg","image/discuss/2- (25).jpg",
"image/discuss/2- (26).jpg","image/discuss/2- (27).jpg","image/discuss/2- (28).jpg");
INSERT INTO talk VALUES(null,
"美好的生活从吃开始",
now(),"image/discuss/2- (62).jpg","image/discuss/2- (62).jpg","image/discuss/2- (63).jpg","image/discuss/2- (64).jpg",
"image/discuss/2- (65).jpg","image/discuss/2- (66).jpg","image/discuss/2- (67).jpg");
INSERT INTO talk VALUES(null,
"6.19 早餐～?夏天虽然离不开热，但还是好喜欢，因为一切看起来都那么明艳、那么富有生机!",
now(),"image/discuss/2- (36).jpg","image/discuss/2- (36).jpg","image/discuss/2- (37).jpg","image/discuss/2- (38).jpg",
"image/discuss/2- (39).jpg","image/discuss/2- (40).jpg","image/discuss/2- (41).jpg");

8.评论表(comment):uname 评论人名称，ccontent 评论内容，tid 评论对象 id

create table comment(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    uname       VARCHAR(100),
    ccontent    VARCHAR(100),
    tid         INT
);

SET NAMES GBK;
INSERT INTO comment VALUES(null,"爱美食的志宝妈","看起来不错",null);
INSERT INTO comment VALUES(null,"公主家的笨笨","美味无法阻挡",null);
INSERT INTO comment VALUES(null,"Hellobaby你好宝贝","决定尝试做一下",null);
INSERT INTO comment VALUES(null,"七十二变小菊子","做过几次，不太好吃啊",null);

