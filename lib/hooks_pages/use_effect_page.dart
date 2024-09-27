
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UseEffectPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final count = useState(0);

    useEffect(() {
      print('Effect ran - count is ${count.value}');
      return () => print('Cleanup - count was ${count.value}');
    }, [count.value]);

    return Scaffold(
      appBar: AppBar(title: Text('useEffect Hook')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${count.value}'),
            ElevatedButton(
              onPressed: () => count.value++,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}