package binary

const (
	MagicNumber = 0x6D736100 // `\0asm`
	Version     = 0x00000001 // 1
)

const (
	SecCustomID = iota
	SecTypeID
	SecImportID
	SecFuncID
	SecTableID
	SecMemID
	SecGlobalID
	SecExportID
	SecStartID
	SecElemID
	SecCodeID
	SecDataID
)

const (
	ImportTagFunc   = 0
	ImportTagTable  = 1
	ImportTagMem    = 2
	ImportTagGlobal = 3
)

const (
	ExportTagFunc   = 0
	ExportTagTable  = 1
	ExportTagMem    = 2
	ExportTagGlobal = 3
)

const (
	PageSize     = 65536 // 64KB
	MaxPageCount = 65536 // 2 ^ 16
)


type (
	TypeIdx   = uint32 // 类型索引 类型段
	FuncIdx   = uint32 // 函数索引 导入段(内部函数) 代码段(外部函数)
	TableIdx  = uint32 // 表索引  0
	MemIdx    = uint32 // 内存索引  0
	GlobalIdx = uint32 // 全局变量索引 外包全局变量 内部全局变量
	LocalIdx  = uint32 // 局部变量索引 参数 + 局部变量
	LabelIdx  = uint32 // 跳转标签索引
)

type Module struct {
	Magic      uint32
	Version    uint32
	CustomSecs []CustomSec
	TypeSec    []FuncType
	ImportSec  []Import
	FuncSec    []TypeIdx
	TableSec   []TableType
	MemSec     []MemType
	GlobalSec  []Global
	ExportSec  []Export
	StartSec   *FuncIdx
	ElemSec    []Elem
	CodeSec    []Code
	DataSec    []Data
}

type CustomSec struct {
	Name  string
	Bytes []byte
}


type Import struct {
	Module string
	Name   string
	Desc   ImportDesc
}

type ImportDesc struct {
	Tag      byte
	FuncType TypeIdx    // tag=0
	Table    TableType  // tag=1
	Mem      MemType    // tag=2
	Global   GlobalType // tag=3
}

type Global struct {
	Type GlobalType
	Init Expr
}

type Export struct {
	Name string
	Desc ExportDesc
}

type ExportDesc struct {
	Tag byte
	Idx uint32
}

type Elem struct {
	Table  TableIdx
	Offset Expr
	Init   []FuncIdx
}

type Code struct {
	Locals []Locals
	Expr   Expr
}

type Locals struct {
	N    uint32
	Type ValType
}

type Data struct {
	Mem    MemIdx
	Offset Expr
	Init   []byte
}



func (module Module) GetBlockType(bt BlockType) FuncType {
	switch bt {
	case BlockTypeI32:
		return FuncType{ResultTypes: []ValType{ValTypeI32}}
	case BlockTypeI64:
		return FuncType{ResultTypes: []ValType{ValTypeI64}}
	case BlockTypeF32:
		return FuncType{ResultTypes: []ValType{ValTypeF32}}
	case BlockTypeF64:
		return FuncType{ResultTypes: []ValType{ValTypeF64}}
	case BlockTypeEmpty:
		return FuncType{}
	default:
		return module.TypeSec[bt]
	}
}


func (code Code) GetLocalCount() uint64 {
	n := uint64(0)
	for _, locals := range code.Locals {
		n += uint64(locals.N)
	}
	return n
}
