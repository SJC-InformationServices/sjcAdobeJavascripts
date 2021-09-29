const core = require("generator-core/lib/generator")
const options = {
    host: '10.3.0.102',
    password: '15BentonRoad',
    port: 49494
}
const generator = core.createGenerator()
generator.start(options).done(() => {
    generator.evaluateJSXString('alert("Hello")').then(() => generator.shutdown())
})