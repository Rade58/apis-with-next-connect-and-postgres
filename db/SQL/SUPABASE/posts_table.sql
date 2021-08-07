-- CREATING posts TABLE (EXECUTED FOR SUPABASE DATBASE)

CREATE TABLE posts(
  id BIGINT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  user_id UUID REFERENCES auth.users NOT NULL,
  user_email TEXT,
  titl TEXT,
  content TEXT,
  inserted_at TIMESTAMP WITH ZONE DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);


