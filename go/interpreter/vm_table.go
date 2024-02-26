package interpreter

import "wasm.go/binary"

type table struct {
	_type binary.TableType
	elems []vmFunc
}

func newTable(tt binary.TableType) *table {
	return &table{
		_type: tt,
		elems: make([]vmFunc, tt.Limits.Min),
	}
}

func (t *table) GetElem(idx uint32) vmFunc {
	return t.elems[idx]
}

func (t *table) SetElem(idx uint32, elem vmFunc) {
	t.elems[idx] = elem
}

func (t *table) Size() uint32 {
	return uint32(len(t.elems))
}