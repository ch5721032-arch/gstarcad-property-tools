;; matchprop-loop.lsp - Paint properties from one source onto many objects
;; Command: MP
;; Usage: pick the source object once, then keep picking target objects
(defun c:MP ( / src sel )
  (setq src (car (entsel "\nPick the source object: ")))
  (if src
    (while (setq sel (entsel "\nPick a target object (Enter to finish): "))
      (command "_.MATCHPROP" src (car sel) "")
    )
  )
  (princ)
)
