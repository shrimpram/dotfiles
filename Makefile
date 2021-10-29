update:
	brew update
	brew upgrade
	nix-channel --update
	nix-env -u
	home-manager switch
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'


nvim: nvim-packer
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

nvim-packer:
ifeq (,$(wildcard ~/.local/share/nvim/site/pack/packer/start/packer.nvim))
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
endif
