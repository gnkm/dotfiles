;;; add-to-load-path.el --- add load paths

;;; Commentary:
;; load-path を追加する関数
;; 参考：[[http://www.amazon.co.jp/dp/4774150029/][Emacs 実践入門]]

;;; Code:

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(provide 'add-to-load-path)
;;; add-to-load-path.el ends here
