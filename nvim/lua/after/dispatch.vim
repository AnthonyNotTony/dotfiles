command! -nargs=1 -complete=file GdbDispatch Dispatch gdb -q -ex 'file <args>'
