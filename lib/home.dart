import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double x = 0;
  double y = 0;
  double z = 0;
  double sf = 1;

  setData(double x, [double y = 0, double z = 0]) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // rotateX, rotateY, rotateZ 에 입력되는 값들은 1바뀌가 pi
            // setEntry : 4 x 4행렬의 특정 위치에 값을 넣는 것
            // setEntry(3,2, 0.001) 이라면 z축 원근감을 0.001로 설정한다.
            Center(
              child: Transform(
                transform: Matrix4(
                    1,0,0,0,
                    0,1,0,0,
                    0,0,1,0.002,
                    0,0,0,1)
                  ..rotateX(x)
                  ..rotateY(y)
                  ..rotateZ(z),
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    print('x : $x, cal : ${details.delta.dy / 100}, dy : ${details.delta.dy}');
                    setState(() {
                      y = y - details.delta.dx / 100;
                      x = x + details.delta.dy / 100;
                    });
                  },
                  child: Container(
                    color: Colors.red,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  x = 0;
                  y = 0;
                  z = 0;
                  sf = 1;
                });
              },
              child: Text("Reset"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  x += 1;
                });
              },
              child: Text("X up"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  y += 1;
                });
              },
              child: Text("Y up"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sf += 1;
                });
              },
              child: Text("SF up"),
            ),
          ],
        ),
      ),
    );
  }
}
