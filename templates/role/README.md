# Ansible Roleの雛形

## 雛形が必要な理由

Ansibleには、`ansible-galaxy init`というRoleの雛形を作成するコマンドが存在する。
しかし、これによって生成される雛形をそのまま用いると`ansible-lint`で無数の警告が出る。
その問題を回避するためにこの雛形を作成した。
