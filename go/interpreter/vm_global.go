package interpreter

import (
	"errors"

	"wasm.go/binary"
)

type globalVar struct {
	_type binary.GlobalType
	val   uint64
}

func newGlobal(gt binary.GlobalType, val uint64) *globalVar {
	return &globalVar{_type: gt, val: val}
}

func (g *globalVar) GetAsU64() uint64 {
	return g.val
}

func (g *globalVar) SetAsU64(val uint64) {
	if g._type.Mut != 1 {
		panic(errors.New("immutable global"))
	}
	g.val = val
}

