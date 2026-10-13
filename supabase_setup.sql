-- Enable the pgvector extension
create extension if not exists vector;

-- Create the table to store document chunks
create table brain_chunks (
  id bigserial primary key,
  content text,
  metadata jsonb,
  embedding vector(1536) -- Matches OpenAI text-embedding-3-small dimensions
);

-- Create a search function for your AI agents to query later
create function match_brain_chunks (
  query_embedding vector(1536),
  match_threshold float,
  match_count int
)
returns table (
  id bigint,
  content text,
  metadata jsonb,
  similarity float
)
language sql stable
as $$
  select
    brain_chunks.id,
    brain_chunks.content,
    brain_chunks.metadata,
    1 - (brain_chunks.embedding <=> query_embedding) as similarity
  from brain_chunks
  where 1 - (brain_chunks.embedding <=> query_embedding) > match_threshold
  order by brain_chunks.embedding <=> query_embedding
  limit match_count;
$$;
