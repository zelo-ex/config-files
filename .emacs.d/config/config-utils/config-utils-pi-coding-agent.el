;;; -*- lexical-binding: t -*-

(use-package pi-coding-agent
  :ensure t
  :init (defalias 'pi 'pi-coding-agent)
  :custom
  (pi-coding-agent-input-window-height 10)        ; Height of input window
  (pi-coding-agent-tool-preview-lines 10)         ; Lines shown before collapsing tool output
  (pi-coding-agent-bash-preview-lines 5)          ; Lines shown for bash output
  (pi-coding-agent-context-warning-threshold 70)  ; Warn when context exceeds this %
  (pi-coding-agent-context-error-threshold 90)    ; Critical when context exceeds this %
  (pi-coding-agent-visit-file-other-window t)     ; RET opens file in other window (nil for same)
  (pi-coding-agent-hot-tail-turn-count 3)         ; Recent headed turns that re-wrap on resize
  ;; (pi-coding-agent-thinking-display 'visible)      ; Expand completed thinking by default
  ;; (pi-coding-agent-thinking-hidden-preview nil)    ; Always use generic "Thinking hidden…" stubs
  ;; (pi-coding-agent-copy-raw-markdown t)            ; Keep raw markdown on copy (default: strip hidden markup)
  ;; (pi-coding-agent-input-markdown-highlighting t)  ; tree-sitter markdown highlighting in input buffer
  )

(provide 'config-utils-pi-coding-agent)
