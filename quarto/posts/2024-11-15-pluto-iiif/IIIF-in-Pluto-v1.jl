### A Pluto.jl notebook ###
# v0.19.47

using Markdown
using InteractiveUtils

# ╔═╡ 48fa7e4e-a333-11ef-2ea1-7fde7aa97b4d
using HypertextLiteral	

# ╔═╡ 1d185c49-4ca4-4c72-8c6b-5f657bd77395
md"""# A IIIF viewer in Pluto: version 1"""

# ╔═╡ 0664d812-7bc8-4ac9-9072-2b7738c941a5
manifesturl = "https://raw.githubusercontent.com/neelsmith/complutensian-texts/refs/heads/main/iiif/complutensian-bne-v1-manifest.json"


# ╔═╡ e96cd25e-8417-4568-97af-a79ac55232d1
md"""Prerequisites: we'll need the `HypertextLiteral` package"""

# ╔═╡ 562189ba-254d-4496-a7ba-db917dc6bf10
md"""Step 1: load the TIFY library and its accompanying CSS:"""

# ╔═╡ 2cf6b7e0-7fab-4576-bf90-95757c939594
@htl("""
<script src="https://cdn.jsdelivr.net/npm/tify@0.31.0/dist/tify.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tify@0.31.0/dist/tify.css"></link>
""")

# ╔═╡ acd30d13-45d8-49f0-8648-b3c4dfd9b6cc
md"""Step 2: Instantiate a TIFY object:"""

# ╔═╡ c967f3ce-cb79-42ea-9ad7-ccad50c606a7
@htl("""
<script>
new Tify({
  container: '#tify',
  manifestUrl: $manifesturl,
})
</script>
""")

# ╔═╡ 34707b89-a272-4d65-b454-af185296e211
md"""Step 3: define the HTML block displaying the image:"""

# ╔═╡ 1d5da59c-6ceb-4d7d-8c13-49d799a7e0dc
@htl"""
<div id='tify' style='height: 800px'></div>
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"

[compat]
HypertextLiteral = "~0.9.5"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.6"
manifest_format = "2.0"
project_hash = "5b37abdf7398dc5da4cd347d0609990238d895bb"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.Tricks]]
git-tree-sha1 = "7822b97e99a1672bfb1b49b668a6d46d58d8cbcb"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.9"
"""

# ╔═╡ Cell order:
# ╟─1d185c49-4ca4-4c72-8c6b-5f657bd77395
# ╠═0664d812-7bc8-4ac9-9072-2b7738c941a5
# ╟─e96cd25e-8417-4568-97af-a79ac55232d1
# ╠═48fa7e4e-a333-11ef-2ea1-7fde7aa97b4d
# ╟─562189ba-254d-4496-a7ba-db917dc6bf10
# ╠═2cf6b7e0-7fab-4576-bf90-95757c939594
# ╟─acd30d13-45d8-49f0-8648-b3c4dfd9b6cc
# ╠═c967f3ce-cb79-42ea-9ad7-ccad50c606a7
# ╟─34707b89-a272-4d65-b454-af185296e211
# ╠═1d5da59c-6ceb-4d7d-8c13-49d799a7e0dc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
