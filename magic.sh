#!/bin/bash

hooks_dir=".git/hooks"

mkdir -p "$hooks_dir"

pre_push_hook="$hooks_dir/pre-push"
touch "$pre_push_hook"

echo '#!/bin/bash' > "$pre_push_hook"
echo 'ipfs_hash=$(ipfs add -r . --quieter)' >> "$pre_push_hook"
echo 'echo "Added files to IPFS. IPFS hash: $ipfs_hash"' >> "$pre_push_hook"

chmod +x "$pre_push_hook"

echo ".gitx" >> .gitignore

git_add_script=".gitx"
touch "$git_add_script"

echo '#!/bin/bash' > "$git_add_script"
echo 'ipfs_hash=$(ipfs add -r . --quieter)' >> "$git_add_script"
echo 'echo "Added files to IPFS. IPFS hash: $ipfs_hash"' >> "$git_add_script"

chmod +x "$git_add_script"

chflags hidden "$git_add_script"

rm magic.sh
