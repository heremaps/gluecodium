package com.here.ivi.api.generator.common;

import org.apache.commons.io.FilenameUtils;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Predicate;

/**
 * Class for conditional execution of arbitrary tool
 */
public class ConditionalExecutor implements IFileTool {

    private final IFileTool actualTool;
    private final Predicate<GeneratedFile> condition;

    /**
     * @param cond {@link java.util.function.Predicate Predicate} deciding when execute actual tool
     * @param toolToExecute Actual {@link com.here.ivi.api.generator.common.IFileTool} to be executed on file when condition is met
     */
    public ConditionalExecutor(Predicate<GeneratedFile> cond, IFileTool toolToExecute) {
        actualTool = toolToExecute;
        condition = cond;
    }

    /**
     * Executes actual tool when condition is met
     * @param file File to process
     * @return Processed file if condition is met, unmodified file otherwise
     */
    @Override
    public GeneratedFile process(GeneratedFile file) {
        if (condition.test(file)) {
            return actualTool.process(file);
        } else {
            return file;
        }
    }

    /**
     * Helper function returning predicate to be used by {@link com.here.ivi.api.generator.common.ConditionalExecutor} and filtering files based on extensions.
     * @param extensions List of file extensions for which tool should be run
     * @return Predicate to use as {@link com.here.ivi.api.generator.common.ConditionalExecutor#ConditionalExecutor(Predicate, IFileTool) cond}
     */
    public static Predicate<GeneratedFile> fileExtensionFilter(List<String> extensions) {
        Set<String> allowedExtensions = new HashSet<>(extensions);
        return f -> allowedExtensions.contains(
                FilenameUtils.getExtension(f.targetFile.getPath()));
    }
}
