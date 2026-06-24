import { useState, useEffect, useCallback } from "react";
import { getCategories } from "../services/api";
import { Category } from "../types";

export function useFetchCategories() {
  const [categories, setCategories] = useState<Category[]>([]);
  const [loadingCategories, setLoadingCategories] = useState(true);

  const refetchCategories = useCallback(async () => {
    setLoadingCategories(true);

    try {
      const data = await getCategories();
      setCategories(data);
    } catch (error) {
      console.error("Error fetching categories:", error);
    } finally {
      setLoadingCategories(false);
    }
  }, []);

  useEffect(() => {
    void refetchCategories();
  }, [refetchCategories]);

  return { categories, loadingCategories, refetchCategories };
}
