import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';

T useDebounce<T>(T value, Duration delay) {
  final debouncedValue = useState<T>(value);
  
  useEffect(() {
    final timer = Timer(delay, () {
      debouncedValue.value = value;
    });
    
    return timer.cancel;
  }, [value, delay]);
  
  return debouncedValue.value;
}
