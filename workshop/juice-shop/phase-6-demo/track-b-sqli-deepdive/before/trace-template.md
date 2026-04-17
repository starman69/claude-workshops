# Vulnerability Trace — Template

Fill in as you trace the endpoint.

- **Endpoint (verb + path):** _______________
- **Route registration (`file:line`):** _______________
- **Handler / controller (`file:line`):** _______________
- **Query / sink (`file:line`):** _______________
- **Sink type:** ☐ raw SQL concat   ☐ `eval` / dynamic JS   ☐ shell (`exec` / `spawn`)   ☐ template injection   ☐ other: ___
- **Input taint path:** how does user input flow from the request into the sink?
  - Source (`req.body.X` / `req.query.Y` / header): _______________
  - Transformations (trim, JSON parse, cast): _______________
  - Validator encountered? ☐ yes (describe) ☐ no
- **Why it is exploitable (one sentence):** _______________
- **Suggested fix category:** ☐ parameterized query   ☐ input validator   ☐ escape/encode   ☐ deny-list   ☐ other: ___
