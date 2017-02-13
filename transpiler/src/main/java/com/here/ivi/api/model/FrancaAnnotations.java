package com.here.ivi.api.model;

import org.franca.core.franca.FAnnotation;
import org.franca.core.franca.FAnnotationType;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Helper for reading annotations and documentation from the structured franca comments
 */
public class FrancaAnnotations {

    /**
     * Maps all the annotations into a map of annotation-type to list of comments
     *
     * @param annotations The annotations, as retrieved from a franca element
     * @return The mapped annotations
     */
    public static Map<FAnnotationType, Set<String>> toMap(Collection<FAnnotation> annotations) {
        return annotations.stream().collect(Collectors.groupingBy(
                FAnnotation::getType,
                Collectors.mapping(FAnnotation::getComment, Collectors.toSet())));
    }
}
