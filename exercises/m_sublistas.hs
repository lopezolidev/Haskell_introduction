import Distribution.SPDX.LicenseId (licenseIdMigrationMessage)
mSublistas :: (Eq a) => [a] -> a -> [[a]]
mSublistas [] _ = [[]]
mSublistas lista e 
    | null resto = [parte]
    | otherwise = parte : mSublistas (tail resto) e
    where
        parte = takeWhile (/= e) lista
        resto = dropWhile (/= e) lista 
