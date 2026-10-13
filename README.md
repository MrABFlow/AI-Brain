# 🧠 AI-Brain Starter Kit

This starter kit automatically syncs markdown files from GitHub into a Supabase Vector Database (`pgvector`) to power AI applications.

## 📁 What's Included
- `n8n_workflow.json` - Plug-and-play n8n vectorization pipeline.
- `supabase_setup.sql` - SQL script to set up vector storage and search functions.

## 🛠️ How to Set Up ( without touching a line of code )

### Step 1: Supabase Setup
1. Create a project in [Supabase](https://supabase.com).
2. Go to the **SQL Editor** (`>_`), open a new query, and run the code ( it's attached here you just have to copy and paste ) inside `supabase_setup.sql`.

### Step 2: n8n Import
1. In your n8n workspace, click **Import from File** and select `n8n_workflow.json`.
2. Connect your own **GitHub** credentials to the Trigger and Get File nodes.
3. Connect your **Supabase** Project URL and `service_role` secret key to the Supabase Vector Store node.
4. Connect your **OpenAI** API key to the OpenAI Embeddings node.


💡 Quick Tip for n8n: Open ⁠Brain n8n workflow.json⁠ on GitHub, click Copy raw file, then press ⁠Cmd + V⁠ directly on your n8n canvas to import it instantly!


### Step 3: Start Syncing
Push any `.md` file to your configured repository to automatically embed and store its chunks in Supabase!

### Need Help?
If you get stuck or confused at any point during the setup, feel free to DM me on IG ('@atharvvbhardwaj') and I'll help you get it running!
