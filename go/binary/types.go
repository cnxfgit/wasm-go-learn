package binary

import "fmt"

type ValType = byte

const (
	ValTypeI32 ValType = 0x7F // i32
	ValTypeI64 ValType = 0x7E // i64
	ValTypeF32 ValType = 0x7D // f32
	ValTypeF64 ValType = 0x7C // f64

	BlockTypeI32   BlockType = -1  // ()->(i32)
	BlockTypeI64   BlockType = -2  // ()->(i64)
	BlockTypeF32   BlockType = -3  // ()->(f32)
	BlockTypeF64   BlockType = -4  // ()->(f64)
	BlockTypeEmpty BlockType = -64 // ()->()

	FtTag   = 0x60
	FuncRef = 0x70

	MutConst byte = 0
	MutVar   byte = 1
)

type FuncType struct {
	Tag         byte
	ParamTypes  []ValType
	ResultTypes []ValType
}

type Limits struct {
	Tag byte
	Min uint32
	Max uint32
}

type MemType = Limits

type TableType struct {
	ElemType byte // 目前只能是 0x70
	Limits   Limits
}

type GlobalType struct {
	ValType ValType
	Mut     byte
}


func ValTypeToStr(vt ValType) string {
	switch vt {
	case ValTypeI32:
		return "i32"
	case ValTypeI64:
		return "i64"
	case ValTypeF32:
		return "f32"
	case ValTypeF64:
		return "f64"
	default:
		panic(fmt.Errorf("invalid valtype: %d", vt))
	}
}