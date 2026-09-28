;; entity-dump.lsp - Print the raw DXF data of a picked object
;; Command: DUMP
;; Usage: for debugging scripts and seeing exactly how an entity is stored
(defun c:DUMP ( / en ed )
  (setq en (car (entsel "\nPick an object to inspect: ")))
  (if en
    (progn
      (setq ed (entget en))
      (foreach pair ed
        (princ (strcat "\n" (vl-princ-to-string pair)))
      )
    )
  )
  (princ)
)
