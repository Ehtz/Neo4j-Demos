To retrieve cypher from instance:

```
CALL apoc.export.cypher.all(null, {
  stream: true,
  useOptimizations: {type: "UNWIND_BATCH", unwindBatchSize: 20},
  format: "plain"
});
```
