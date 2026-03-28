# Decision Checklist

## Vault Analysis

- Count eligible `.md` files after excluding templates, conflicts, config directories, and attachments.
- Measure total text size, average note size, median, p90, and largest notes.
- Inspect heading density, lists, code fences, and wiki links.
- Inspect image usage and whether images carry essential information or are mostly decorative.
- Determine language mix. For Chinese technical notes, assume mixed Chinese + English terms until proven otherwise.

## Storage Layout

- Put the RAG project, vector DB, logs, and state outside the synced Obsidian vault.
- Keep the source vault read-only from the RAG pipeline unless the user explicitly wants writeback.

## Model and Retrieval Choices

- Choose embedding model from language mix and hardware, not from note count alone.
- Turn on hybrid retrieval when exact terms, commands, filenames, or code-like tokens matter.
- Add reranking once the base retrieval is working and measurable.
- Prefer score thresholds over blindly filling top-k with weak tail results.

## OCR Choices

- Treat remote images as an explicit policy choice. If they must be searchable, use `fetch-and-cache` over direct network access, store the downloaded files outside the vault, and report both `remote_refs` and `remote_ready`.
- For local images, preserve heading path plus nearby markdown context.
- Cache OCR text by image path, size, and `mtime_ns` plus OCR config.
- Cache image-context chunks separately when title path and nearby text also match.
- Benchmark `ocr.parallel_workers` on representative image-heavy notes. Pick the measured winner instead of assuming higher parallelism is better.
- Treat `max_images_per_note` as a build-time throttle. If complete coverage matters more than build speed, set it to `0` for unlimited processing.
- Add cache cleanup conservatively: remove entries whose source image no longer exists or whose payload is invalid. For remote image caches, also prune files that are no longer referenced by any note in the vault. Use TTL only when storage pressure actually justifies it.

## Sync and Reliability

- Use file snapshot diffing for markdown changes.
- Add dependency signatures for image-backed notes.
- Log stage starts, per-file progress, elapsed time, ETA, cache hits, and worker counts.
- For large first builds, checkpoint and resume instead of restarting from zero.

## Validation

- Run real user questions from the vault.
- Check that the top results come from the expected notes.
- If noise remains, inspect whether the problem is chunking, retrieval, reranking, or display cutoffs.
