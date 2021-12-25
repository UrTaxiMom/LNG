import SwiftUI

struct ContentView: View {
    
    @State private var user_name = ""
    @State private var singer_year=Date()
    @State private var does_shownextpage = false
    @State private var alert_showing = false
    @State private var start_to_recommend = false
    @State private var alert_content = ""
    @State private var memberindex=0
    @State private var theSize: Double = 25
    @State private var selected_color = Color.white
    var member = ["六嘆", "鳥屎", "老王", "leggy", "八毛", "小六"]
    var LNGname = ["六嘆", "鳥屎", "老王", "leggy", "八毛", "小六","FICK", "李迅"]
    
    var body: some View {
        VStack {
            Text("LNG介紹")
                .fontWeight(.bold)
                .padding()
                .font(.system(size: theSize * 1.25))
                .position(x: 185, y: 50)
            Form {
                if !does_shownextpage {
                    TextField("請輸入您的名字", text: $user_name)
                        .padding()
                        .font(.system(size: theSize * 1.25))
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.blue, lineWidth: 2.5))
                    
                    DatePicker("生日", selection: $singer_year, displayedComponents: .date)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.red, lineWidth: 2.5))
                    .position(x: 150, y: 30)
                    Button(action: {
                        if user_name == "" {
                            alert_showing = true
                        }
                        else {
                            does_shownextpage = true
                        }
                    }) {
                        Text("輸入完畢")
                            .padding()
                            .font(.system(size: theSize))
                            
                    }
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.red, lineWidth: 2.5))
                    .position(x: 150, y: 30)
                    .alert(isPresented: $alert_showing) { () -> Alert in
                        let alert_content = "請輸入名字！"
                            return Alert(title: Text(alert_content))
                    }
                    
                    HStack {
                        Text("版面大小")
                        Slider(value: self.$theSize, in: 20...25,
                                minimumValueLabel: Image(systemName:
                                "tv").imageScale(.small), maximumValueLabel: Image(systemName: "tv").imageScale(.large)) {
                                        Text("")
                        }
                    }
                    ColorPicker("設定背景顏色", selection: $selected_color)

                }
                
                if does_shownextpage {
                    Button(action: {user_name = LNGname.randomElement()!}) {
                        Text("LNG隨機改名")
                            .padding()
                            .font(.system(size: theSize))
                            
                    }
                    Text("諸君還有\(user_name)早安！！")
                        .padding()
                        .font(.system(size: 20))
                    
                    DisclosureGroup("LNG簡介") {
                        Text("最近迷上的實況聊天團體，在台灣實況史中有著重要地位")
                    }
                    
                    Picker(selection: $memberindex, label: Text("")) {
                        ForEach(0 ..< member.count) { i in
                            Text(self.member[i]).tag(i)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                    Toggle("選擇完成", isOn: $start_to_recommend.animation())
                }
            }
                .position(x: 185, y: -100)
                .background(selected_color)
            if start_to_recommend {
                if memberindex == 0 {
                    List {
                        Text("六嘆(6tan)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("本名汪光磊，3月8日出生，桃園中壢人。曾為雷亞遊戲公司員工曾任Justin.tv、Twitch繁中區管理員。於麥卡貝網路電視《現在宅知道》擔任主持人。代表著LNG中的L，源於「六嘆」的「六」發音。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("6tan FB", destination: URL(string: "https://www.facebook.com/6tantan")!)
                        Image("六嘆")
                            .resizable()
                            .scaledToFill()
                    }
                        .position(x: 185, y: -100)
                        
                }
                else if memberindex == 1 {
                    List {
                        Text("鳥屎(Niaws)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("本名蘇志翔，4月11日出生，桃園中壢人。曾任Justin.tv、Twitch繁中區管理員。於麥卡貝網路電視《現在宅知道》擔任主持人。代表著LNG中的N，源於「鳥屎」的「鳥」發音。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("Niaws-鳥屎 FB", destination: URL(string: "https://www.facebook.com/LNGniaws")!)
                        Image("鳥屎")
                            .resizable()
                            .scaledToFill()
                    }
                        .position(x: 185, y: -80)
                }
                else if memberindex ==  2 {
                    List {
                        Text("老王(歌姬(WannaSinging))")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("因為早期是以星海歌姬著名，所以歌姬的歌，代表著LNG中的G，而不是Ｌ。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("WannaSinging老王 FB", destination: URL(string: "https://www.facebook.com/WannaSinging")!)
                        Image("老王")
                            .resizable()
                            .scaledToFill()
                    }
                        .position(x: 185, y: -80)
                }
                else if memberindex == 3 {
                    List {
                        Text("Leggy(山神Reki)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("早期為niconico生放送主，原名為レキ（Reki）。由於太多人讀音錯誤，索性改成目前的Leggy 。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("Leggy FB", destination: URL(string: "https://www.facebook.com/LeggyReki")!)
                        Image("Leggy")
                            .resizable()
                            .scaledToFill()
                    }
                        .position(x: 185, y: -80)
                }
                else if memberindex == 4 {
                    List {
                        Text("八毛(Bamow)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("參加LNG第一屆北部台聚後和六嘆、鳥屎、老王熟識，而後加入LNG一起實況。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("八毛-Bamow FB", destination: URL(string:"https://www.facebook.com/LngBamow")!)
                        Image("八毛")
                            .resizable()
                            .scaledToFill()
                    }
                    .position(x: 185, y: -80)
                }
                else if memberindex == 5 {
                    List {
                        Text("小六(Mabushii)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Text("鳥屎的大學室友，在服完兵役後被鳥屎等友人說服進入了實況圈並加入LNG一起實況。")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1.5))
                        Link("小六 Mabushii FB", destination: URL(string: "https://www.facebook.com/Mabushii0611")!)
                        Image("小六")
                            .resizable()
                            .scaledToFill()
                    }
                        .position(x: 185, y: -80)
                }
            }
            
        }
        .background(selected_color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
