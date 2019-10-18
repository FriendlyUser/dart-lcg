import './lcg_interface.dart';

/// The event handler responsible for updating the badge in the UI.
class LCG implements LCG_Interface { 
  // lcg multiplier
  final int _a;
  // lcg increment
  final int _c;
  // lcg modulus
  final int _m;
  int _xi;
  // seed 
  int seedValue;
  int get multiplier {return _a;}
  int get increment {return _c;}
  int get modulus {return _m;}
  int get seed {return seedValue;}
  //setters
  void set seed(int newSeed) {seedValue = newSeed;}
  // constructor
  LCG(this._a,this._c,this._m, this.seedValue) {
    if ( _c % _m == 0 && seedValue % _m == 0) {
        _xi = 1;
    } else {
        _xi = seedValue;
    }
  }

  // can't get the operators working, skip for dart
/*   int operator() { 
    _xi = _next();
    return _xi;
  } */
  int nextNum() {
    _xi = _next();
    return _xi;
  }
  void discard(int n) {
    for (int i = 0; i < n; i++) {
      _xi = nextNum();
      // cout << "Next Iterator Value is: " << xi;
    }
  }
  int min() {
    if( _c == 0) return 1;
    return 0;
  }
  int max() {
    return _m-1;
  }
  int _next() {
    return (_a * _xi +_c) % _m;
  }

}

void main() { 
  LCG cp = new LCG(5,4,3,2); 
  print(cp.multiplier);
  print(cp.increment);
  print(cp.modulus);
  print(cp.seed);
  cp.seed = 5;
  print(cp.seed);
  print(cp.nextNum());
}
