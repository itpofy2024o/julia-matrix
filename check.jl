println("the dimension of matrix, i = j, =>")

dimension = readline()

dimension = parse(Int64,dimension)

all_parts = []

while true
  println("$(length(all_parts)/2) entry:")
  println("real part")
  real = readline()
  real = parse(Int64,real)
  println("complex part")
  comp = readline()
  comp = parse(Int64,comp)
  entry = complex(real,comp)
  push!(all_parts,entry)
  println(entry,length(all_parts))
  if length(all_parts)==dimension*dimension
    break
  end
end

ij = dimension

matrix = reshape(all_parts,dimension,dimension)

matrix_conjugate = conj(matrix)

matrix_transpose = transpose(matrix_conjugate)

println("original matrix")

println(matrix)

println()

println("conjugation of the matrix")

println(matrix_conjugate)

println()

println("transpose of the matrix conjugation")

println(matrix_transpose)

println()

if matrix == matrix_transpose
  println("this is a hermitian matrix")

  pair = (ij*ij-ij)/2

  println("there is #$(pair) of pairs of conjugation")

  gs = []

  md = []

  start = ij*ij

  push!(md,start)

  while true
    if last(md)-ij-1 == 1
      push!(md,1)
      break
    else
      push!(md,last(md)-ij-1)
    end
  end

  println(md," <= main diagonal graph nodes")

  for h in 1:ij*ij
    g = (h-1-(ij+1)*floor((h-1)/ij))*(ij-1)
    push!(gs,g)
    if in(h,md) == true && g != 0.0
      println("this is not a hermitian matrix")
    end
  end

  mgs = reshape(gs,ij,ij)

  for i in 1:size(mgs, 1)
    for j in 1:size(mgs, 1)
      print(mgs[i, j], "\t")
    end
    println()
  end
end
