<div id="calculator">
  <div class="row text-center" id="calc">
    <div class="calcBG col-md-12 text-center">
      <div class="row" id="result">
        <form name="calc">
          <input type="text" class="screen text-right" name="result" readonly>
        </form>
      </div>
      <div class="row">
        <button id="allClear" type="button" class="btn btn-danger" onclick="clearScreen()">AC</button>
        <button id="clear" type="button" class="btn btn-warning" onclick="clearScreen()">CE</button>
        <button id="%" type="button" class="btn" onclick="calEnterVal(this.id)">%</button>
        <button id="/" type="button" class="btn" onclick="calEnterVal(this.id)">÷</button>
      </div>
      <div class="row">
        <button id="7" type="button" class="btn" onclick="calEnterVal(this.id)">7</button>
        <button id="8" type="button" class="btn" onclick="calEnterVal(this.id)">8</button>
        <button id="9" type="button" class="btn" onclick="calEnterVal(this.id)">9</button>
        <button id="*" type="button" class="btn" onclick="calEnterVal(this.id)">x</button>
      </div>
      <div class="row">
        <button id="4" type="button" class="btn" onclick="calEnterVal(this.id)">4</button>
        <button id="5" type="button" class="btn" onclick="calEnterVal(this.id)">5</button>
        <button id="6" type="button" class="btn" onclick="calEnterVal(this.id)">6</button>
        <button id="-" type="button" class="btn" onclick="calEnterVal(this.id)">-</button>
      </div>
      <div class="row">
        <button id="1" type="button" class="btn" onclick="calEnterVal(this.id)">1</button>
        <button id="2" type="button" class="btn" onclick="calEnterVal(this.id)">2</button>
        <button id="3" type="button" class="btn" onclick="calEnterVal(this.id)">3</button>
        <button id="+" type="button" class="btn" onclick="calEnterVal(this.id)">+</button>
      </div>
      <div class="row">
        <button id="0" type="button" class="btn" onclick="calEnterVal(this.id)">0</button>
        <button id="." type="button" class="btn" onclick="calEnterVal(this.id)">.</button>
        <button id="equals" type="button" class="btn btn-success" onclick="calculate()">=</button>
        <button id="blank" type="button" class="btn">&nbsp;</button>
      </div>
    </div>
  </div>
</div>

<script>
  document.addEventListener('keydown', function(event) {
    const key = event.key;
    switch (key) {
        case 'Escape': // Effacer tout
            clearScreen();
            break;
        case 'Backspace': // Effacer un seul caractère
            deleteLastChar();
            break;
        case '+':
        case '-':
        case '*':
        case '/':
            calEnterVal(key);
            break;
        case '%':
            calEnterVal('%');
            break;
        case '.':
            calEnterVal('.');
            break;
        case 'Enter':
            event.preventDefault(); // Empêche le rechargement de la page
            calculate();
            break;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            calEnterVal(key);
            break;
        default:
            break;
    }
});

function calEnterVal(val) {
    const screen = document.querySelector('.screen');
    if (val === 'Backspace') {
        deleteLastChar();
    } else {
        screen.value += val;
    }
}

function deleteLastChar() {
    const screen = document.querySelector('.screen');
    screen.value = screen.value.slice(0, -1);
}

function calculate() {
    const screen = document.querySelector('.screen');
    try {
        screen.value = eval(screen.value.replace(/÷/g, '/').replace(/x/g, '*'));
    } catch (e) {
        screen.value = 'Error';
    }
}

function clearScreen() {
    document.querySelector('.screen').value = '';
}
</script>