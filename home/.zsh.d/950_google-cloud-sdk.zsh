# Google Cloud SDKを有効にする。

local base_path=/Users/sho-h/google-cloud-sdk
if [ -d $base_path ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source "${base_path}/path.zsh.inc"

  # The next line enables bash completion for gcloud.
  source "${base_path}/completion.zsh.inc"
fi

# Local variables:
# mode: sh
# coding: utf-8
# End:
