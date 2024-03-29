-- let upstream = https://github.com/dfinity/vessel-package-set/releases/download/mo-0.10.0-20230911/package-set.dhall sha256:7bce6afe8b96a8808f66b5b6f7015257d44fc1f3e95add7ced3ccb7ce36e5603
-- mo-0.9.7-20230718
let upstream = 
[ 
	{ dependencies = [] : List Text
  , name = "base"
  , repo = "https://github.com/dfinity/motoko-base.git"
  , version = "8e942b3d724099e4a47f5cc7ce13ae0bfd575a28" -- updated to mo-0.10.3
  }
, { dependencies = [ "base" ]
  , name = "sha256"
  , repo = "https://github.com/enzoh/motoko-sha.git"
  , version = "9e2468f51ef060ae04fde8d573183191bda30189"
  }
, { dependencies = [ "base" ]
  , name = "sha224"
  , repo = "https://github.com/flyq/motoko-sha224.git"
  , version = "95e271a0997c9219afd8e5a418ed487d2db84d3f" -- updated to Dec 23, 2023
  }
]
let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

let
  -- This is where you can add your own packages to the package-set
  additions =
    [
		{ 
			dependencies = [ "base", "sha224" ], 
			name = "icl",
			repo = "https://github.com/iclighthouse/icl-vessel", 
			version = "9fc51825f8aacd8b32d9f8f1cab88a7ac8f5778b"
		}
    ] : List Package

let
  {- This is where you can override existing packages in the package-set

     For example, if you wanted to use version `v2.0.0` of the foo library:
     let overrides = [
         { name = "foo"
         , version = "v2.0.0"
         , repo = "https://github.com/bar/foo"
         , dependencies = [] : List Text
         }
     ]
  -}
  overrides =
    [] : List Package

in  upstream # additions # overrides