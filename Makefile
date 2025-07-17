watch:
	dart run build_runner watch -d

# Git hooks
HOOKS = commit-msg

install-hooks:
	@for hook in $(HOOKS); do \
		cp tools/git/hooks/$$hook .git/hooks/$$hook && chmod +x .git/hooks/$$hook; \
		echo "🗑️ Installed hook: $$hook"; \
	done
	@echo "✅ All Git hooks installed!"

remove-hooks:
	@for hook in $(HOOKS); do \
		if [ -f .git/hooks/$$hook ]; then \
			rm .git/hooks/$$hook; \
			echo "🗑️ Removed hook: $$hook"; \
		else \
			echo "⚠️ Hook not found: $$hook"; \
		fi \
	done
	@echo "✅ All git hooks processed!"
