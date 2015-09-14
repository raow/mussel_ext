# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'admin@test.com', password: '12345678', role: '管理员', approved_at: Time.now)


vendor1 = ServiceVendor.create(name: "上海鸿畅汽车牵引有限公司", contact: "郑总", phone: "13677662134", province: "上海市", city: "上海市", region: "闸北区", location_details: "三泉路3号")
vendor2 = ServiceVendor.create(name: "上海叶达汽车修理厂", contact: "顾海斌", phone: "13677662135", province: "上海市", city: "上海市", region: "崇明县", location_details: "陈家镇裕民路18号")
vendor3 = ServiceVendor.create(name: "上海畅弘汽车牵引服务有限公司", contact: "穆成杰", phone: "13677662136", province: "上海市", city: "上海市", region: "嘉定区", location_details: "御山路360弄11号101室")
vendor4 = ServiceVendor.create(name: "上海俊盈汽车维修有限公司", contact: "陈伟", phone: "13677662137", province: "上海市", city: "上海市", region: "奉贤区", location_details: "奉城镇新奉公路7007-7017号")

vendor5 = ServiceVendor.create(name: "北京泛亚汽车修理分公司", contact: "张先生", phone: "13677662138", province: "北京市", city: "北京市", region: "顺义区", location_details: "顺通路27号")
vendor6 = ServiceVendor.create(name: "北京海运顺畅汽车救援服务中心", contact: "王总", phone: "13677662139", province: "北京市", city: "北京市", region: "顺义区", location_details: "李桥镇李家桥村干渠东路临17号")
vendor7 = ServiceVendor.create(name: "楚雄市东瓜天成进口汽车修理厂", contact: "杨永生", phone: "13677662130", province: "云南省", city: "楚雄彝族自治州", region: "楚雄市", location_details: "小河口")
vendor8 = ServiceVendor.create(name: "永隆维修售后服务站", contact: "戴瑾", phone: "13677662134", province: "云南省", city: "彝族自治州", region: "蒙自县", location_details: "蒙自市银河路北段4号")

vendor9 = ServiceVendor.create(name: "成华区丰瑞汽车租赁行", contact: "彭开奎", phone: "13677662131", province: "四川省", city: "成都市", region: "成华区", location_details: "青龙乡洪山北路210号")
vendor10 = ServiceVendor.create(name: "德阳思铭汽车服务有限公司 ", contact: "朱劲松", phone: "13677662132", province: "四川省", city: "德阳市", region: "市辖区", location_details: "蒲江街杨柳巷R2号")
vendor11 = ServiceVendor.create(name: "昌盛汽车修配厂", contact: "刘宝昌", phone: "13677662133", province: "吉林省", city: "吉林市", region: "船营区", location_details: "南京街179-7号")
vendor12 = ServiceVendor.create(name: "广宇名车修配厂", contact: "刘研", phone: "13677662144", province: "吉林省", city: "松原市", region: "乾安县", location_details: "种子公司北100米")

vendor13 = ServiceVendor.create(name: "武乡县通力达汽车俱乐部", contact: "李玉鹏", phone: "13677662154", province: "山西省", city: "长治市", region: "武乡县", location_details: "太行东路110号")
vendor14 = ServiceVendor.create(name: "山西省运城市卫氏拖车救援中心", contact: "卫小民", phone: "13677662164", province: "山西省", city: "运城市", region: "市辖区", location_details: "大渠办事处向东100米")
vendor15 = ServiceVendor.create(name: "贵阳乌当明达救援中心", contact: "冯平", phone: "13677662174", province: "贵州省", city: "贵阳市", region: "乌当区", location_details: "温石路梅兰山果蔬批发市场旁")
vendor16 = ServiceVendor.create(name: "钟山区荷办中成汽车救援", contact: "罗雄华", phone: "13677662184", province: "贵州省", city: "六盘水市", region: "中山区", location_details: "人民东路181号")

vendor17 = ServiceVendor.create(name: "铜川市王益区鑫海汽车修理厂", contact: "冀天峰", phone: "13677662194", province: "陕西省", city: "铜川市", region: "王益区", location_details: "宜园桥南站")
vendor18 = ServiceVendor.create(name: "汉中唐龙汽车救援公司", contact: "余经理", phone: "13677662104", province: "陕西省", city: "汉中市", region: "市辖区", location_details: "铺镇转盘向南100米")
vendor19 = ServiceVendor.create(name: "西宁市城中区给力汽车救援服务中心", contact: "王俊芳", phone: "13677662114", province: "青海省", city: "西宁市", region: "城中区", location_details: "南川东路南酉山村")
vendor20 = ServiceVendor.create(name: "格尔木市西部进口汽配有限责任公司", contact: "雷明", phone: "13677662124", province: "青海省", city: "海西蒙古自治州", region: "格尔木市", location_details: "八一西路12号")

User.create(email: vendor1.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor1.id)
User.create(email: vendor2.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor2.id)
User.create(email: vendor3.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor3.id)
User.create(email: vendor4.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor4.id)
User.create(email: vendor5.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor5.id)

User.create(email: vendor6.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor6.id)
User.create(email: vendor7.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor7.id)
User.create(email: vendor8.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor8.id)
User.create(email: vendor9.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor9.id)
User.create(email: vendor10.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor10.id)

User.create(email: vendor11.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor11.id)
User.create(email: vendor12.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor12.id)
User.create(email: vendor13.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor13.id)
User.create(email: vendor14.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor14.id)
User.create(email: vendor15.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor15.id)

User.create(email: vendor16.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor16.id)
User.create(email: vendor17.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor17.id)
User.create(email: vendor18.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor18.id)
User.create(email: vendor19.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor19.id)
User.create(email: vendor20.phone + "@test.com", password: "12345678", role: "供应商", approved_at: Time.now, service_vendor_id: vendor20.id)

item1 = ServiceItem.create(name: "代办年检验车")
item2 = ServiceItem.create(name: "违章代办")
item3 = ServiceItem.create(name: "开锁")
item4 = ServiceItem.create(name: "机场接送")
item5 = ServiceItem.create(name: "洗车")
item6 = ServiceItem.create(name: "更换轮胎")
item7 = ServiceItem.create(name: "酒后代驾")
item8 = ServiceItem.create(name: "事故车拖带")
item9 = ServiceItem.create(name: "紧急送油")

vendor1.service_items << [ item1, item2, item3, item4 ]
vendor2.service_items << [ item1, item2, item3, item4, item5, item6 ]
vendor3.service_items << [ item1, item2, item3, item4, item6, item7, item8 ]
vendor4.service_items << [ item1, item2, item3, item4, item6 ]
vendor5.service_items << [ item1, item2, item3, item4, item7 ]
vendor6.service_items << [ item1, item2, item3, item4, item8 ]
vendor7.service_items << [ item1, item2, item3, item4, item9, item5, item6 ]
vendor8.service_items << [ item1, item2, item3, item4, item5 ]
vendor9.service_items << [ item1, item2, item3, item4, item6 ]
vendor10.service_items << [ item1, item2, item3, item4, item7 ]
vendor11.service_items << [ item1, item2, item3, item4, item8 ]
vendor12.service_items << [ item1, item2, item3, item4, item9 ]
vendor13.service_items << [ item1, item2, item3, item4, item5 ]
vendor14.service_items << [ item1, item2, item3, item4, item6 ]
vendor15.service_items << [ item1, item2, item3, item4, item7 ]
vendor16.service_items << [ item1, item2, item3, item4, item8 ]
vendor17.service_items << [ item1, item2, item3, item4, item9 ]
vendor18.service_items << [ item1, item2, item3, item4, item5 ]
vendor19.service_items << [ item1, item2, item3, item4, item6 ]
vendor20.service_items << [ item1, item2, item3, item4, item7 ]