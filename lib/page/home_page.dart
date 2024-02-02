import 'package:flutter/material.dart';
import '../AWS_Connector.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
        title: Row(
          children: [
            Icon(Icons.subway),
            SizedBox(width: 8.0),
            Text('CAUSIGHT'),
          ],
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OCRSearch()));
            },
            color: Colors.pink,
            height: 50,
            minWidth: 150,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.photo_camera, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  '주변 텍스트 확인',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10),

        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // 시작: 검색 영역 코드
            Row(
              children: [
                Expanded(
                  flex: 4, // 5:1의 비율로 화면 공간을 나누어줍니다.
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(10.0),
                      //border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                hintText: '출발지',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.search),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0), // 출발지와 도착지 사이의 간격
                        Stack(
                          alignment: Alignment.centerRight,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                hintText: '도착지',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.search),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.swap_vert, color: Colors.purple),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.directions, color: Colors.purple),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10), // 검색 영역과 다음 컨테이너 사이의 간격
            Divider(
              color: Colors.grey, // 원하는 색상으로 변경 가능
              height: 10, // 원하는 높이로 조절 가능
              thickness: 0.5, // 선의 두께
            ),

            IntrinsicHeight(
              child: Row(
                children: [
                  // 첫 번째 컨테이너
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10.0, right: 5.0), // 오른쪽 여백 추가
                      decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 5.0),
                                  Text(
                                    '지하철 내부 정보 표현',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 5.0),
                          // 여기에 첫 번째 컨테이너의 나머지 위젯들을 넣을 수 있습니다.
                        ],
                      ),
                    ),
                  ),

                  // 두 번째 컨테이너
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10.0, left: 5.0), // 왼쪽 여백 추가
                      decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // 여기에 두 번째 컨테이너의 위젯들을 넣을 수 있습니다.
                          Wrap(
                            spacing: 10.0,
                            children: [
                              SizedBox(width:10.0),
                              Text(
                                '역 정보',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Station1()));
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0.0),
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                                ),
                                child: Text('7 상도역', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Station2()));
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0.0),
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                                ),
                                child: Text('5총신대', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.purple, size: 30.0),
                          // 원하는 아이콘으로 변경 가능
                          SizedBox(width: 3.0),
                          // 제목과 아이콘 사이의 간격
                          Text(
                            '내 위치 주변 검색',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                        MaterialButton(
                          onPressed: () {},
                          color: Colors.white,
                          height: 45,
                          minWidth: 100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_searching),
                              SizedBox(width: 8),
                              Text(
                                '장소 검색',
                                style: TextStyle(fontWeight: FontWeight.bold,),
                              ),
                            ],
                          ),
                        ),
                      ],
                  ),
                  SizedBox(height: 5.0),
                  Wrap(
                    spacing: 10.0, // 가로 방향의 간격
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Something()));
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                        ),
                        child: Text('편의점', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.purple),
                        ),
                        child: Text('화장실', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.purple),
                        ),
                        child: Text('출구', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.purple),
                        ),
                        child: Text('약국', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      ElevatedButton(

                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.purple),
                        ),
                        child: Text('엘리베이터', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

class OCRSearch extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('OCR'),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 버튼들을 세로 중앙에 배치합니다.
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                ),
                child: Text('뒤로 가기'),
              ),
              SizedBox(height: 20), // 두 버튼 사이에 간격을 추가합니다.
              ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(Colors.pink), // 새 버튼의 배경색을 설정합니다.
                ),
                child: Text('서버 연결'),
              ),
            ],
          ),
        )

    );
  }
}

class Something extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('편의점'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor:
            MaterialStateProperty.all(Colors.purple),
          ),
          child: Text('뒤로 가기'),
        ),
      ),
    );
  }
}

class Station1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('7 상도역'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor:
            MaterialStateProperty.all(Colors.green),
          ),
          child: Text('뒤로 가기'),
        ),
      ),
    );
  }
}

class Station2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('5 총신대입구역'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor:
            MaterialStateProperty.all(Colors.blue),
          ),
          child: Text('뒤로 가기'),
        ),
      ),
    );
  }
}