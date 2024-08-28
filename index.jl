m_complex = [
    1+0im 0+2im 0-1im 4-1im;
    0-2im 8+0im 0+6im 8+1im;
    0+1im 0-6im 12+0im 0+1im;
    4+1im 8-1im 0-1im 20+0im
] # complex matrix

m_conjugate = conj(m_complex) # conjugated form

m_transpose = transpose(m_conjugate) # conjugate transpose

m_c_m_ct = false

if m_transpose==m_complex
    m_c_m_ct=true
end

println(m_transpose)

# println("complex matrix M\n$m_complex")

# println("its conjugation\n$m_conjugate")

# println("and its hermitian transpose\n$m_transpose")

println("as m == m's conjugate transpose => $(m_c_m_ct)")

if m_c_m_ct==true
    println("m is a hermitian matrix")
end

ij = size(m_transpose,1)

println("dimension of this hermitian matrix is $(ij)")

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
