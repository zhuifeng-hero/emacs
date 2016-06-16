;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;设置自定义快捷键--创建新的 prefix command
;;================================================================
(define-prefix-command 'alt-t-map)
(global-set-key (kbd "M-t") 'alt-t-map)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;简单功能
;;================================================================
(setq mouse-yank-at-point t);鼠标中键粘贴
(global-linum-mode) ;显示行号
;(setq column-number-mode t);显示行号
(fset 'yes-or-no-p 'y-or-n-p) ;yes简称
(tool-bar-mode -1) ;不显示图标栏
(setq initial-scratch-message "");不显示启动界面
(setq make-backup-files nil);禁止备份文件"~
(setq mouse-drag-copy-region t) ;;鼠标快速复制
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;recentf mode设置
;;================================================================
(recentf-mode t);打开recentf mode
(setq recentf-max-menu-items 25) ;最多保存25个
(global-set-key (kbd "M-t f") 'recentf-open-files)
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;快速切换至上个buffer---------shift+tab
(global-set-key (kbd "<backtab>") #'(lambda ()
                                      (interactive)
                                      (switch-to-buffer (other-buffer (current-buffer) 1))))
;;___________________________________________________________
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;逗号后自动加空格
(global-set-key (kbd ",")
                #'(lambda ()
                    (interactive)
                    (insert ", ")))
;;___________________________________________________________
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;键盘宏的录制和回放
(global-set-key (kbd "C-x x") 'call-last-kbd-macro)
;;___________________________________________________________
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;访问文件
(defconst my-emacs-path "E:/develop/emacs/")  ;;设置常量
(defun visit-learnemacs()
  (interactive)
  (find-file (concat my-emacs-path "学习笔记.org")))
(global-set-key (kbd "C-c h")' visit-learnemacs)
(defun visit-.emacs()
  (interactive)
  (find-file "E:/develop/emacs/settings/.emacs.d/.init/zhuifeng.el"))
(global-set-key (kbd "C-x .") 'visit-.emacs)
;;___________________________________________________________

;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;添加查找路径
(add-to-list 'load-path "E:/develop/emacs/")
;;___________________________________________________________
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;词典功能
(global-set-key (kbd "C-c d") 'youdao-dictionary-search-at-point+)
;;___________________________________________________________
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;VB编辑
;; autoload visual-basic-mode
(load "~/.emacs.d/visual-basic-mode")
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ;VBscript
(add-to-list 'auto-mode-alist '("\\.vb\\'" . visual-basic-mode))  ;visual basic .NET file
(add-to-list 'auto-mode-alist '("\\.bas\\'" . visual-basic-mode)) ;visual basic form
(add-to-list 'auto-mode-alist '("\\.frm\\'" . visual-basic-mode)) ;basic language source
(add-to-list 'auto-mode-alist '("\\.cls\\'" . visual-basic-mode)) ;C++ class definition file
;;___________________________________________________________
(set-locale-environment "zh_CN.UTF-8")
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;
(setq diary-file "E:/develop/emacs/diary") ;设置日记文件路径
;;___________________________________________________________
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;

(setq org-agenda-files (list "E:/develop/emacs/plan.org"                    
			     "E:/develop/emacs/question.org"))
;(setq org-todo-keywords
;      '((sequence "TODO(t)" "|" "DONE(d)"))) ;增加TODO Item的状态
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
     (global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done 'time) ;完成时，添加时间戳
(setq org-log-done 'note);完成时，出现一buffer，用来添加心得或备注
(setq org-src-fontify-natively t);org中代码块语法高亮
;;___________________________________________________________

;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;简单功能
(find-file "E:/develop/emacs/temp.org");;启动时打开文件
(setq default-major-mode 'org-mode) ;;把缺省的 major mode 设置为 text-mode

;;______________________________________________________
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;一个简单的办法设置 auto-mode-alist, 免得写很多 add-to-list.
(mapcar
 (function (lambda (setting)
	     (setq auto-mode-alist
		   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))
;;______________________________________________________

;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;已报废代码
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;自定义函数-------------添加批注
(defun zhushi()
  (interactive)
  (insert ";;++++++++++++++++++++++++++++++++++++++++++++++++++++++\n;;\n;;++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    )

(global-set-key (kbd "C-c t") 'zhushi)
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;录制键盘宏--------------添加批注
(fset 'kbdpz
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([59 59 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 43 return 59 59 return 59 59 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95 95  return left up] 0 "%d")) arg)))
(global-set-key (kbd "C-q") 'kbdpz)
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;___________________________________________________________
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;拷贝代码自动格式化
;Emacs 里对代码的格式化支持的非常好，不但可以在编辑的时候自动帮你格式化，还可以选中一块代码，
;;按 Ctrl-Alt-\ 对这块代码重新进行格式化.如果要粘贴一块代码的话，粘贴完了紧接着按 Ctrl-Alt-\,
;;就可以把新加入的代码格式化好。可是，对于这种粘贴加上重新格式化的机械操作，Emacs 应该可以将
;;它自动化才能配得上它的名气，把下面的代码加到配置文件里，你的 Emacs 就会拥有这种能力了
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(
                     c-mode
                     c++-mode
                     clojure-mode
                     emacs-lisp-mode
                     haskell-mode
                     js-mode
                     latex-mode
                     lisp-mode
                     objc-mode
                     perl-mode
		     visual-basic-mode
                     cperl-mode
                     plain-tex-mode
                     python-mode
                     rspec-mode
                        ruby-mode
                     scheme-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))


;;______________________________________________________
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;;插件扩展原功能----------修改快捷键
;;======================================================
(global-set-key (kbd "M-x") 'smex) ;;smex-----命令提示
(global-set-key (kbd "C-s") 'swiper) ;;搜索
;;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


