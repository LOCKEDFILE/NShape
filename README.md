# Flutter ���ٰ���

���� (n)�� �Է¹޾� �� n������ �׸��� �ڵ�

## ��� ��

~~~dart
Widget  nShape({int side}) {
	return  CustomPaint(
		painter:  Shape(side: side), // N����
		child:  Text(
			'�� $side ����',
			style:  TextStyle(
				fontSize:  32,
			),
		),
	);
}
~~~

## ����

![����](./img/example.jpg)
 
![����](./img/example2.jpg)

![����](./img/example3.jpg)