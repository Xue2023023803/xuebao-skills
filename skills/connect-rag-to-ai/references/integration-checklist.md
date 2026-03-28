# Integration Checklist

## Preconditions

- Retrieval already works on real questions.
- Evidence items include at least source path, title path, text, and score.
- The local knowledge base has a stable config and update path.

## Bridge Layer

- Implement one stable retrieval function such as `search(question) -> evidence`.
- Build prompts from evidence, not from the raw vector DB.
- Add an explicit system rule: answer only from supplied evidence, say when evidence is insufficient, and cite sources.

## Provider Layer

- Ollama: verify service health, installed model, host, and registry/network behavior.
- OpenAI/Codex: verify API key, model name, and network reachability.
- Record failures in terms of service, auth, download, or model availability.

## Interfaces

- `web.py`: local HTTP bridge plus browser UI once the lower layers are stable.
- Keep the provider and prompt assembly logic reusable under the web layer instead of coupling it to a terminal entrypoint.

## UX Expectations From This Project

- Users prefer a persistent browser chat experience over terminal-style one-shot prompts.
- Web should feel like a real product: session list, sources, timings, and usable evidence display.
- If images matter, the final answer should be able to cite OCR-derived chunks just like normal text chunks.

## Validation

- Ask one question that should obviously hit a known note.
- Ask one operational question where exact terms matter.
- Confirm citations point to the expected files.
- Confirm the weakest tail result is either filtered out or visibly low-confidence.
