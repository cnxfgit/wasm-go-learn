package interpreter

import "wasm.go/binary"

type WasmVal = interface{}

type GoFunc = func(args []WasmVal) []WasmVal

type vmFunc struct {
	_type  binary.FuncType
	code   binary.Code
	goFunc GoFunc
}

func newInternalFunc(ft binary.FuncType, code binary.Code) vmFunc {
	return vmFunc{
		_type: ft,
		code:  code,
	}
}

func newExternalFunc(ft binary.FuncType, gf GoFunc) vmFunc {
	return vmFunc{_type: ft, goFunc: gf}
}
