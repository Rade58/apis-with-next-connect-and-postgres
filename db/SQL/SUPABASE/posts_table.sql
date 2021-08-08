-- CREATING posts TABLE (TO BE EXECUTED FOR POSTGRES INSTANCE
--                          ON SUPABASE)

CREATE TABLE posts(
  id BIGINT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  user_id UUID REFERENCES auth.users NOT NULL,
  user_email TEXT,
  title TEXT,
  content TEXT,
  inserted_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

--

ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- PUT DOUBLE QUOTES HERE

CREATE POLICY "Individuals can create posts." ON posts FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Individuals can update their own posts." ON posts FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "Individuals can delete their own posts." ON posts FOR DELETE USING (auth.uid() = user_id);

CREATE POLICY "Post are public." ON posts FOR SELECT USING (true);