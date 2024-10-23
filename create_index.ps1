function Get-DirectoryStructure {
    param (
        [string]$path = ".",
        [int]$depth = 0
    )

    $items = Get-ChildItem -Path $path

    foreach ($item in $items) {
        $indent = "  " * $depth
        if ($item.PSIsContainer) {
            # It's a directory
            "- $indent[$($item.Name)](./$($item.Name))"
            Get-DirectoryStructure -path $item.FullName -depth ($depth + 1)
        } else {
            # It's a file
            "$indent- [$($item.Name)](./$($item.Name))"
        }
    }
}

# Run the function and output to a file
Get-DirectoryStructure | Out-File -FilePath "project_index.md"