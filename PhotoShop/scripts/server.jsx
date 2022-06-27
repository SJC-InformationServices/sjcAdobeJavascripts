#target "photoshop";

#include "cropandcentercintas.jsx";
#include "alphalaydowns.jsx";
#include "alphalaydowns4x5.jsx";
#include "alphalaydowns4x5AlignBottom.jsx";
#include "alpha4x5NoPath.jsx";
#include "alphalaydowntrimmed.jsx";

app.displayDialogs = DialogModes.NO;
app.preferences.rulerUnits = Units.PIXELS;

$isRunningFile = new File('C:\\Users\\InformationServices\\Documents\\PhotoShopScripts\\isRunning.log');
$isRunningFile.open("w");
$isRunningFile.close();

var a = alphalaydowns();
var b = alphalaydownalt();
var d = alphalaydownalignbottom();
var d = alphaCropNoClipPath();
var e = alphalaydowntrimmed();

$isRunningFile.remove();
$app.exit();